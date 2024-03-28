package com.estsoft.springproject.controller;


import com.estsoft.springproject.domain.dto.CommentResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.domain.dto.BoardResponse;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.CommentService;
import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/boards")
@Slf4j
public class BoardController {
    private final BoardService boardService;
    private final CommentService commentService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    @PostMapping
    public ModelAndView addBoard(
            /*@AuthenticationPrincipal User user,    // TODO: 로그인한 사람만 게시글 생성 가능*/
            @ModelAttribute("boardRequest") BoardRequest request,
            Model model
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        Board board = boardService.save(request, user);
        model.addAttribute("board", new BoardResponse(board));
        return new ModelAndView("redirect:/boards");
    }

    @DeleteMapping("/{id}")
    public ModelAndView deleteBoard(
            /*@AuthenticationPrincipal User user,  // TODO: 인증자만 삭제 가능하도록 만들기*/
            @PathVariable Long id
    ) {
        boardService.deleteById(id);
        return new ModelAndView("redirect:/boards");
    }

    @PutMapping("/{id}")
    public ModelAndView updateBoard(
            /*@AuthenticationPrincipal User user,  // TODO: 인증자만 수정 가능하도록 만들기*/
            @PathVariable Long id,
            @ModelAttribute("boardRequest") BoardRequest request
    ) {
        Board board = boardService.update(id, request);
        return new ModelAndView("redirect:/boards/" + id);
    }

    @GetMapping
    public ModelAndView showBoards(
            Model model,
            @RequestParam(value="page", defaultValue="1") int page
    ) {
        Page<Board> paging = this.boardService.findAll(page);
        model.addAttribute("paging", paging);

//        return new ModelAndView("boardList");
        return new ModelAndView("test/boardList");  // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/{id}")
    public ModelAndView showBoard(
            /*@AuthenticationPrincipal User user,  // TODO: 사용자 정보 넘기기*/
            @PathVariable Long id,
            Model model
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        model.addAttribute("user", user);

        Board board = boardService.findById(id);
        model.addAttribute("board", new BoardResponse(board));

        List<Comment> comments = commentService.findByBoardId(id);
        List<CommentResponse> responseList = comments.stream().map(CommentResponse::new).toList();
        model.addAttribute("comments", responseList);

//        return new ModelAndView("board");
        return new ModelAndView("test/board");   // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/new-board")
    public ModelAndView newBoard(
            Model model,
            @RequestParam(required = false) Long id
    ) {
        if (id == null) {  // 등록
            model.addAttribute("board", new BoardResponse());
        } else {  // 수정
            Board board = boardService.findById(id);
            model.addAttribute("board", new BoardResponse(board));
        }
//        return new ModelAndView("newBoard");
        return new ModelAndView("test/newBoard");   // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/search")
    public String getBoardBySearchType(Model model,
        @RequestParam("searchType") String searchType,
        @RequestParam("searchQuery") String searchQuery
    ) {
        List<BoardResponse> boards = new ArrayList<>();
        if("nickname".equals(searchType)){
            boards = boardService.findByUserNickName(searchQuery).stream().map(BoardResponse::new).toList();
        } else if("title".equals(searchType)){
            boards = boardService.findByTitle(searchQuery).stream().map(BoardResponse::new).toList();
        }
        model.addAttribute("boards", boards);
        return "/test/boardList";
    }
}
