package com.estsoft.springproject.controller;

import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.estsoft.springproject.domain.dto.UserRequest;
import com.estsoft.springproject.service.UserService;

@Controller
public class UserViewController {
	@Autowired
	private UserService userService;

	@GetMapping("/login")
	public String login(){
		return "test/login";
	}

	@GetMapping("/signup")
	public String showSignupForm() {
		return "test/signup";
	}

	@PostMapping("/adduser")
	public String signup(@Validated UserRequest request, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "test/signup";
		}

		Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
		if (!emailPattern.matcher(request.getEmail()).matches()) {
			bindingResult.rejectValue("email", "error.userRequest", "올바른 이메일 주소를 입력하세요.");
			return "test/signup";
		}

		boolean isNicknameAvailable = userService.isNicknameAvailable(request.getNickname());
		if (!isNicknameAvailable) {
			bindingResult.rejectValue("nickname", "error.userRequest", "이미 사용 중인 닉네임입니다.");
			return "test/signup";
		}

		Pattern passwordPattern = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&~]{8,}$");
		if (!passwordPattern.matcher(request.getPassword()).matches()) {
			bindingResult.rejectValue("password", "error.userRequest", "비밀번호는 영어소문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
			return "test/signup";
		}

		userService.save(request);
		return "redirect:/login";
	}

	// 닉네임 중복 검사를 위한 메서드 추가

	@GetMapping("/checkNicknameAvailability")
	@ResponseBody
	public ResponseEntity<?> checkNicknameAvailability(@RequestParam String nickname) {
		boolean isAvailable = userService.isNicknameAvailable(nickname);
		return ResponseEntity.ok().body(Map.of("available", isAvailable));
	}


}
