package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.CommentRequest;
import com.estsoft.springproject.domain.dto.CommentResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.CommentService;
import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/boards/{boardId}/comments")
public class CommentController {
    private final CommentService commentService;
    private final BoardService boardService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    @PostMapping
    public ResponseEntity<CommentResponse> addComment(
        @PathVariable Long boardId,
        @RequestBody CommentRequest request,
        @AuthenticationPrincipal UserDetails userDetails
    ) {

            Long userId = getUserIdFromUserDetails(userDetails);
            if (userId != null) {
                User user = userService.findById(userId);
                if (user != null) {
                    Board board = boardService.findById(boardId);
                    if (board != null) {
                        Comment comment = commentService.save(request, user, board);
                        CommentResponse response = new CommentResponse(comment);
                        return ResponseEntity.ok(response);
                    } else {
                        // 게시글이 없는 경우
                        return ResponseEntity.notFound().build();
                    }
                }
              
            }
      
//           Board board = boardService.findById(boardId);
//           Comment parent = commentService.findById(request.getParentId());
//           Comment comment = commentService.save(request, user, board, parent);
//           CommentResponse response = new CommentResponse(comment);
//         return ResponseEntity.ok(response);
            // 사용자 정보를 가져올 수 없는 경우
//                 return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }
    private Long getUserIdFromUserDetails(UserDetails userDetails) {
        if (userDetails instanceof User) {
            return ((User) userDetails).getId();
        }
        return null;

    }

    @GetMapping
    public ResponseEntity<List<CommentResponse>> showComments(
            @PathVariable Long boardId
    ) {
        List<Comment> comments = commentService.findByBoardId(boardId);
        List<CommentResponse> responseList = comments.stream().map(CommentResponse::new).toList();
        return ResponseEntity.ok(responseList);
    }

    @PutMapping("/{commentId}")
    public ResponseEntity<CommentResponse> updateComment(
            @PathVariable Long commentId,
            @RequestBody CommentRequest request
    ) {
        Comment comment = commentService.findById(commentId);
        comment.updateContent(request.getContent());
        commentService.update(comment);
        CommentResponse response = new CommentResponse(comment);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{commentId}")
    public ResponseEntity<Void> deleteComment(
            @PathVariable Long commentId
    ) {
        commentService.deleteById(commentId);
        return ResponseEntity.ok().build();
    }
}
