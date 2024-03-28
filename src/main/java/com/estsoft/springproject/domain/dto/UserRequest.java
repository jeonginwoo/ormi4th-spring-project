package com.estsoft.springproject.domain.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserRequest {
	private String email;
	private String nickname;
	private String password;
}
