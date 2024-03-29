package com.estsoft.springproject.domain.dto;

import java.util.List;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;

import lombok.Getter;

@Getter
public class UserResponse {
	private Long id;
	private String email;
	private String nickname;
	private List<Board> boards;

	public UserResponse(User user) {
		this.id=user.getId();
		this.email =user.getEmail();
		this.nickname = user.getNickname();
		this.boards = user.getBoards();
	}
}
