package com.estsoft.springproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserViewController {

	@GetMapping("/login")
	public String login(){
		return "test/login";
	}

	@GetMapping("/signup")
	public String signup(){
		return "test/signup";
	}

}
