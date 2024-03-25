package com.estsoft.springproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.estsoft.springproject.domain.dto.BoardResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.service.BoardService;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api")
public class BoardPageController {
	@Autowired
	private BoardService boardService;

	@GetMapping("/boardList")
	public String getBoards(Model model){
		List<BoardResponse> boards = boardService.findAll().stream().map(BoardResponse::new).toList();
		model.addAttribute("boards",boards);
		return "boardList";
	}

	@GetMapping("/board/{id}")
	public String getBoard(Model model,@PathVariable Long id){
		Board board = boardService.findById(id);
		model.addAttribute("board",new BoardResponse(board));
		return "board";
	}

	@DeleteMapping("/board/{id}")
	public String deleteBoard(@PathVariable Long id){
		boardService.deleteById(id);
		return "redirect:/boardList";
	}
}
