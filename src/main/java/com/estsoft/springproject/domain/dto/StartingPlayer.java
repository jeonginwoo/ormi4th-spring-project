package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StartingPlayer {

    private String id;
    private String matchInfoId;
    private int order;
    private int positionId;
    private String name;
    private Long playerId;
    private Long teamId;
    private int uniformNumber;
    private String hand;
}
