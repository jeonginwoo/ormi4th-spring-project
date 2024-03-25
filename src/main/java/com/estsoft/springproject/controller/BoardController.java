package com.estsoft.springproject.controller;


import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.domain.dto.BoardResponse;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@Slf4j
public class BoardController {
    private final BoardService boardService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    public BoardController(BoardService boardService, UserService userService) {
        this.boardService = boardService;
        this.userService = userService;
    }

    @PostMapping("/api/boards")
    public ResponseEntity<BoardResponse> addBoard(
            @RequestBody BoardRequest request
            /*@AuthenticationPrincipal User user    // TODO: 로그인한 사람만 게시글 생성 가능*/
    ) {
        User user = userService.findById(1L);
        Board board = boardService.save(request, user);
        BoardResponse response = new BoardResponse(board);
        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/api/boards")
    public ResponseEntity<List<BoardResponse>> showBoards() {
        List<Board> boardList = boardService.findAll();
        List<BoardResponse> resopnseList = boardList.stream().map(BoardResponse::new).toList();
        return ResponseEntity.ok(resopnseList);
    }

    @GetMapping("/api/boards/{id}")
    public ResponseEntity<BoardResponse> showBoard(
            @PathVariable Long id
    ) {
        Board board = boardService.findById(id);
        BoardResponse response = new BoardResponse(board);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/api/boards/{id}")
    public ResponseEntity<Void> deleteBoard(
            @PathVariable Long id
            /*@AuthenticationPrincipal User user  // TODO: 인증자만 삭제 가능하도록 만들기*/
    ) {
        boardService.deleteById(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/api/boards/{id}")
    public ResponseEntity<BoardResponse> updateBoard(
            @PathVariable Long id,
            @RequestBody BoardRequest request
            /*@AuthenticationPrincipal User user  // TODO: 인증자만 수정 가능하도록 만들기*/
    ) {
        Board board = boardService.update(id, request);
        BoardResponse updated = new BoardResponse(board);
        return ResponseEntity.ok(updated);
    }
}
