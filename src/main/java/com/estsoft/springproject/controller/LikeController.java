package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.LikeResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Like;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.LikeService;
import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/boards/{id}")
public class LikeController {
    private final BoardService boardService;
    private final LikeService likeService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    @PostMapping("/like")
    public ResponseEntity<LikeResponse> addLike(
            /*@AuthenticationPrincipal User user,    // TODO: 로그인한 사람만 게시글 생성 가능*/
            @PathVariable Long id
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        Board board = boardService.findById(id);
        Like like = new Like(user, board);
        likeService.addLike(like);
        LikeResponse response = new LikeResponse(like);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/like")
    public ResponseEntity<Void> deleteLike(
            /*@AuthenticationPrincipal User user,    // TODO: 로그인한 사람만 게시글 생성 가능*/
            @PathVariable Long id
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        Board board = boardService.findById(id);
        likeService.deleteLike(user.getId(), board.getId());
        return ResponseEntity.ok().build();
    }
}
