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
}
