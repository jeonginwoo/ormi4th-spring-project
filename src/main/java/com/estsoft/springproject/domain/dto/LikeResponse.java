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
    Long user_id;
    Long board_id;

    public LikeResponse(Like like) {
        this.user_id = like.getUser().getId();
        this.board_id = like.getBoard().getId();
    }
}
