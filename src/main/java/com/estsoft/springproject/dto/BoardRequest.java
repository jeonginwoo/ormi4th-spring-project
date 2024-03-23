package com.estsoft.springproject.dto;

import com.estsoft.springproject.domain.Board;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;

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
