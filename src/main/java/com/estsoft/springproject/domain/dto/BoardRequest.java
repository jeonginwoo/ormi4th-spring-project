package com.estsoft.springproject.domain.dto;

import com.estsoft.springproject.domain.entity.Board;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class BoardRequest {
    private String title;
    private String content;

    public BoardRequest(Board board) {
        this.title = board.getTitle();
        this.content = board.getContent();
    }
}
