package com.estsoft.springproject.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.estsoft.springproject.domain.dto.UserResponse;
import com.estsoft.springproject.service.UserService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;

	@GetMapping("/mypage/{userId}")
	public UserResponse getUserMypage(@PathVariable Long userId){
		return userService.getUserMypageInfo(userId);
	}
}
