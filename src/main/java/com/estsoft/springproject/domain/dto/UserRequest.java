package com.estsoft.springproject.domain.dto;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserRequest {
	private String email;
	private String nickname;
	private String password;
	private String role;
	private String currentPassword;
	public void encodePassword(PasswordEncoder passwordEncoder) {
		if (password != null && !password.isEmpty()) {
			this.password = passwordEncoder.encode(password);
		}
	}
}
