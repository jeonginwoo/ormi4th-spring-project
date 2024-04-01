package com.estsoft.springproject.controller;

import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.estsoft.springproject.domain.dto.UserRequest;
import com.estsoft.springproject.domain.dto.UserResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.UserService;

import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final BoardService boardService;

	@GetMapping("/mypage/{userId}")
	public String showUserMypage(@PathVariable Long userId, Model model,
		@RequestParam(value = "boardPage", defaultValue = "1") int boardPage,
		@RequestParam(value = "commentPage", defaultValue = "1") int commentPage) {
		Page<Board> boardPageResult = userService.getUserBoardsPaged(userId, boardPage);
		Page<Comment> commentPageResult = userService.getUserCommentsPaged(userId, commentPage);
		User user = userService.findById(userId);
		model.addAttribute("boardPage", boardPageResult);
		model.addAttribute("commentPage", commentPageResult);
		model.addAttribute("user",user);
		return "test/mypage";
	}




	@GetMapping("/mypage/update/{userId}")
	public String showUpdateForm(@PathVariable("userId") Long userId, Model model) {
		User user = userService.findById(userId); // 사용자 ID로 사용자 정보 조회
		model.addAttribute("user", user); // 모델에 사용자 정보 추가
		return "/test/edit"; // edit.html 페이지로 이동
	}
	@Transactional
	@PutMapping("/mypage/update/{userId}")
	public String updateMypageInfo(@PathVariable Long userId,@ModelAttribute UserRequest userRequest){
		userService.updateUserInfo(userId,userRequest);
		return "redirect:/mypage/" + userId;
	}

	@DeleteMapping("/mypage/{userId}")
	public void deleteUserInfo(@PathVariable Long userId){
		userService.deleteUserInfo(userId);
	} //TODO: 테스트 끝나면 실제 사용할 html로 바꾸기


}
