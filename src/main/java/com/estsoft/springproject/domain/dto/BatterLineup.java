package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BatterLineup {

    private String id;
    private String matchInfoId;
    private int order;
    private String position;
    private Long positionId;
    private Long playerId;
    private String playerName;
    private Long teamId;

    private int gs;
    private int ab;
    private int hits;
    private int runs;
    private int rbi;
    private int homeruns;
    private int so;
    private int bb;
    private double avg;
}
