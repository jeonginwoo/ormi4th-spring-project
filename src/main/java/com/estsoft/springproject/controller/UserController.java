package com.estsoft.springproject.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.estsoft.springproject.domain.dto.UserRequest;
import com.estsoft.springproject.domain.dto.UserResponse;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final BoardService boardService;

	@GetMapping("/mypage/{userId}")
	public UserResponse getUserMypage(@PathVariable Long userId){
		return userService.getUserMypageInfo(userId);
	}

	@PutMapping("/mypage/{userId}")
	public void updateMypageInfo(@PathVariable Long userId,@RequestBody UserRequest userRequest){
		userService.updateUserInfo(userId,userRequest);
	}

	@DeleteMapping("/mypage/{userId}")
	public void deleteUserInfo(@PathVariable Long userId){
		userService.deleteUserInfo(userId);
	}
}
