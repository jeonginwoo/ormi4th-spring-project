package com.estsoft.springproject.domain.dto;

import com.estsoft.springproject.domain.entity.User;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class UserAdminResponse {
	private Long id;
	private String email;
	private String nickname;
	private String role;

	public UserAdminResponse(User user){
		this.role=user.getRole();
		this.id=user.getId();
		this.email=user.getEmail();
		this.nickname=user.getNickname();
	}
}
