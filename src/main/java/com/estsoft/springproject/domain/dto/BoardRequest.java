package com.estsoft.springproject.domain.dto;

import com.estsoft.springproject.domain.entity.Board;
import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class BoardRequest {
    private String type;
    private String team;
    private String title;
    private String content;

    public BoardRequest(Board board) {
        this.type = board.getType();
        this.team = board.getTeam();
        this.title = board.getTitle();
        this.content = board.getContent();
    }
}
