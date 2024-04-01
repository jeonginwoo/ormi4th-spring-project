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
    private Long positionId;

    private double innings;
    private int hits;
    private int runs;
    private int earnedRun;
    private int bb;
    private int so;
    private int homeruns;
    private int np;
    private double era;
    private String decision;
}
