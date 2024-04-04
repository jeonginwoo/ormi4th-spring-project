package com.estsoft.springproject.domain.dto;

import com.estsoft.springproject.domain.entity.Like;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LikeResponse {
    Long userId;
    Long contentId;
    String contentType;

    public LikeResponse(Like like) {
        this.userId = like.getUser().getId();
        this.contentId = like.getContentId();
        this.contentType = like.getContentType();
    }
}
