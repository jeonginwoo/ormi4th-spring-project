package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PitcherRecord {

    private String id;
    private Long playerId;
    private Long teamId;
    private int order;
    private int starter;
    private String decision;
    private double innings;
    private int run;
    private int earnedRun;
    private int ab;
    private int hits;
    private int doubles;
    private int triples;
    private int hr;
    private int bb;
    private int ibb;
    private int hbp;
    private int so;
    private int np;
}
