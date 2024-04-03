package com.estsoft.springproject.controller;


import com.estsoft.springproject.domain.dto.CommentResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.Like;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.domain.dto.BoardResponse;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.CommentService;
import com.estsoft.springproject.service.LikeService;
import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/boards")
@Slf4j
public class BoardController {
    private final BoardService boardService;
    private final CommentService commentService;
    private final LikeService likeService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    @PostMapping
    public ResponseEntity<BoardResponse> addBoard(BoardRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.isAuthenticated() && authentication.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) authentication.getPrincipal();
            Long userId = getUserIdFromUserDetails(userDetails);
            if (userId != null) {
                User user = userService.findById(userId);
                if (user != null) {
                    Board board = boardService.save(request, user);
                    BoardResponse response = new BoardResponse(board);
                    return ResponseEntity.ok(response);
                }
            }
        }
        // 인증되지 않은 사용자 또는 사용자 정보를 가져올 수 없는 경우
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).build();
    }

    private Long getUserIdFromUserDetails(UserDetails userDetails) {
        if (userDetails instanceof User) {
            return ((User) userDetails).getId();
        }
        return null;
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBoard(
            @AuthenticationPrincipal User user,
            @PathVariable Long id
    ) {
        Board board = boardService.findById(id);
        if(user.getEmail().equals(board.getUser().getEmail())) {
            boardService.deleteById(id);
            return ResponseEntity.ok().build();
        }
        else{
            return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<BoardResponse> updateBoard(
            @AuthenticationPrincipal User user,  // TODO: 인증자만 수정 가능하도록 만들기*/
            @PathVariable Long id,
            BoardRequest request
    ) {
        Board board = boardService.findById(id);
        if(board!=null) {
            if (user.getEmail().equals(board.getUser().getEmail())) {
                Board updateBoard = boardService.update(id, request);
                BoardResponse response = new BoardResponse(updateBoard);

                return ResponseEntity.ok(response);
            } else {
                return ResponseEntity.status(HttpStatus.FORBIDDEN).build();
            }
        }
        else{
            return ResponseEntity.notFound().build();
        }

    }

    @GetMapping
    public String showBoards(
            Model model,
            @RequestParam(value="page", defaultValue="1") int page,
            Principal principal
    ) {
        String username = principal != null ? principal.getName() : null;
        model.addAttribute("loggedIn", username != null);
        Page<Board> paging = this.boardService.findAll(page);
        model.addAttribute("paging", paging);

        return "test/boardList";  // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/{id}")
    public String showBoard(
        @AuthenticationPrincipal User user,
        @PathVariable Long id,
        Model model,
        Principal principal
    ) {
        // 사용자
        String username = principal != null ? principal.getName() : null;
        model.addAttribute("loggedIn", username != null);
        if (user == null) {
            // 로그인되지 않은 사용자일 경우 처리
            return "redirect:/login"; // 로그인 페이지로 리다이렉트 혹은 처리할 경로로 변경
        }
        model.addAttribute("user",user);

        // 게시판
        Board board = boardService.findById(id);
        boardService.updateHits(board);
        if (board == null) {
            // 게시글이 없을 경우 처리
            return "error"; // 예시: 에러 페이지로 리다이렉트
        }
        model.addAttribute("board", new BoardResponse(board));

        // 댓글
        List<Comment> comments = commentService.findByBoardId(id);
        List<CommentResponse> responseList = comments.stream().map(CommentResponse::new).toList();
        model.addAttribute("comments", responseList);

        // 답글
        List<List<CommentResponse>> childrenList = new ArrayList<>();
        for (Comment comment : comments) {
            List<Comment> children = commentService.findChildren(comment.getId());
            List<CommentResponse> childrenResponse = children.stream().map(CommentResponse::new).toList();
            childrenList.add(childrenResponse);
        }
        model.addAttribute("childrenList", childrenList);

        // 좋아요
        Like like = likeService.findLike(user.getId(), board.getId());
        model.addAttribute("like", like);

        // 좋아요 수
        int likeNum = likeService.findByBoardId(id).size();
        model.addAttribute("likeNum", likeNum);

        return "test/board";
    }


    @GetMapping("/new-board")
    public String newBoard(
            Model model,
            @RequestParam(required = false) Long id
    ) {
        if (id == null) {  // 등록
            model.addAttribute("board", new BoardResponse());
        } else {  // 수정
            Board board = boardService.findById(id);
            model.addAttribute("board", new BoardResponse(board));
        }

        return "test/newBoard";   // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/search")
    public String getBoardBySearchType(Model model,
        @RequestParam("searchType") String searchType,
        @RequestParam("searchQuery") String searchQuery,
        @RequestParam(value="page", defaultValue="1") int page
    ) {
        Page<Board> boards = Page.empty();
        Pageable pageable = PageRequest.of(page-1, 10);
        if("nickname".equals(searchType)){
            boards = boardService.findByUserNickName(searchQuery, page);
        } else if("title".equals(searchType)){
            boards = boardService.findByTitle(searchQuery, page);
        }
        model.addAttribute("paging", boards);
        model.addAttribute("searchType",searchType);
        model.addAttribute("searchQuery",searchQuery);
        return "test/boardConditionList";
    }
}
