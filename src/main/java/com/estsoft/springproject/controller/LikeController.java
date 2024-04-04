package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.LikeRequest;
import com.estsoft.springproject.domain.dto.LikeResponse;
import com.estsoft.springproject.domain.entity.Like;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.service.LikeService;
import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequiredArgsConstructor
@RequestMapping("/boards/{id}")
public class LikeController {
    private final LikeService likeService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    @PostMapping("/like")
    public ResponseEntity<LikeResponse> addLike(
            /*@AuthenticationPrincipal User user,    // TODO: 로그인한 사람만 게시글 생성 가능*/
            @RequestBody LikeRequest request
    ) {
        User user = userService.findById(4L);       // TODO: 테스트용. 나중에 지울 것!
        Like like = new Like(user, request.getContentId(), request.getContentType());
        likeService.addLike(like);
        LikeResponse response = new LikeResponse(like);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/like")
    public ResponseEntity<Void> deleteLike(
            @AuthenticationPrincipal User user,
            @RequestBody LikeRequest request
    ) {
        likeService.deleteLike(user.getId(), request.getContentId(), request.getContentType());
        return ResponseEntity.ok().build();
    }
}
