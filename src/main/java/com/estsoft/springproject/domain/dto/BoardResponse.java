package com.estsoft.springproject.domain.dto;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;

import lombok.*;

import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardResponse {
    private Long id;
    private String type;    // 일반글/공지글
    private String team;    // 응원 팀
    private String title;
    private String content;
    private Timestamp createdAt;
    private Timestamp modifiedAt;
    private String nickname;    // 작성자
    private Long userId;
    private Long hits;
    private User user;

    public User getUser() {
        return user;
    }

    public BoardResponse(Board board) {
        this.id = board.getId();
        this.type = board.getType();
        this.team = board.getTeam();
        this.title = board.getTitle();
        this.content = board.getContent();
        this.createdAt = board.getCreatedAt();
        this.modifiedAt = board.getModifiedAt();
        this.nickname = board.getUser().getNickname();
        this.userId = board.getUser().getId();
        this.hits = board.getHits();
        this.user = board.getUser();
    }
}