package com.estsoft.springproject.controller;


import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.domain.dto.BoardResponse;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/boards")
@Slf4j
public class BoardController {
    private final BoardService boardService;
    private final UserService userService;      // TODO: 테스트용. 나중에 지울 것!

    @PostMapping
    public ModelAndView addBoard(
            @ModelAttribute("boardRequest") BoardRequest request,
            Model model
            /*@AuthenticationPrincipal User user    // TODO: 로그인한 사람만 게시글 생성 가능*/
    ) {
        User user = userService.findById(1L);       // TODO: 테스트용. 나중에 지울 것!
        Board board = boardService.save(request, user);
        model.addAttribute("board", new BoardResponse(board));
        return new ModelAndView("redirect:/boards");
    }

    @DeleteMapping("/{id}")
    public ModelAndView deleteBoard(
            @PathVariable Long id
            /*@AuthenticationPrincipal User user  // TODO: 인증자만 삭제 가능하도록 만들기*/
    ) {
        boardService.deleteById(id);
        return new ModelAndView("redirect:/boards");
    }

    @PutMapping("/{id}")
    public ModelAndView updateBoard(
            @PathVariable Long id,
            @ModelAttribute("boardRequest") BoardRequest request
            /*@AuthenticationPrincipal User user  // TODO: 인증자만 수정 가능하도록 만들기*/
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

        /*List<Board> boardList = boardService.findAll();
        List<BoardResponse> responseList = boardList.stream().map(BoardResponse::new).toList();
        model.addAttribute("boards", responseList);*/

//        return new ModelAndView("boardList");
        return new ModelAndView("test/boardList");  // TODO: 테스트 끝나면 실제 사용할 html로 바꾸기
    }

    @GetMapping("/{id}")
    public ModelAndView showBoard(
            @PathVariable Long id,
            Model model
    ) {
        Board board = boardService.findById(id);
        model.addAttribute("board", new BoardResponse(board));
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
}
