package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PitcherLineup {

    private String id;
    private String matchInfoId;
    private int order;
    private Long playerId;
    private String playerName;
    private Long teamId;
}
