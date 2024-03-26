package com.estsoft.springproject.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.domain.dto.BoardResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.service.BoardService;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/api")
public class BoardPageController {
	private final BoardService boardService;

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

	@Transactional
	@PutMapping("/board/{id}")
	public String updateBoard(@PathVariable Long id,@RequestBody BoardRequest boardRequest){
		Board board = boardService.findById(id);
		board.update(boardRequest.getTitle(),boardRequest.getContent());
		return "redirect:/board/" + id;
	}

	@PostMapping("/board")
	public String addBoard(@RequestBody BoardRequest boardRequest, User user){
		boardService.save(boardRequest,user);
		return "redirect:/boardList";
	}
}
