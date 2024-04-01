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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public ResponseEntity<BoardResponse> addBoard(
            /*@AuthenticationPrincipal User user,    // TODO: 로그인한 사람만 게시글 생성 가능*/
            BoardRequest request
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        Board board = boardService.save(request, user);
        BoardResponse response = new BoardResponse(board);
        return ResponseEntity.ok(response);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteBoard(
            /*@AuthenticationPrincipal User user,  // TODO: 인증자만 삭제 가능하도록 만들기*/
            @PathVariable Long id
    ) {
        boardService.deleteById(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<BoardResponse> updateBoard(
            /*@AuthenticationPrincipal User user,  // TODO: 인증자만 수정 가능하도록 만들기*/
            @PathVariable Long id,
            BoardRequest request
    ) {
        Board board = boardService.update(id, request);
        BoardResponse response = new BoardResponse(board);

        return ResponseEntity.ok(response);
    }

    @GetMapping
    public String showBoards(
            Model model,
            @RequestParam(value="page", defaultValue="1") int page
    ) {
        Page<Board> paging = this.boardService.findAll(page);
        model.addAttribute("paging", paging);

        return "test/boardList";  // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/{id}")
    public String showBoard(
            /*@AuthenticationPrincipal User user,  // TODO: 사용자 정보 넘기기*/
            @PathVariable Long id,
            Model model
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        model.addAttribute("user", user);

        Board board = boardService.findById(id);
        board = boardService.updateHits(board);
        model.addAttribute("board", new BoardResponse(board));

        List<Comment> comments = commentService.findByBoardId(id);
        List<CommentResponse> responseList = comments.stream().map(CommentResponse::new).toList();
        model.addAttribute("comments", responseList);

        Like like = likeService.findLike(user.getId(), board.getId());
        model.addAttribute("like", like);

        int likeNum = likeService.findByBoardId(id).size();
        model.addAttribute("likeNum", likeNum);

        return "test/board";   // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
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
