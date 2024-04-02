package com.estsoft.springproject.domain.dto;

import lombok.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CommentRequest {
    private String content;
    private Long parentId;
}
