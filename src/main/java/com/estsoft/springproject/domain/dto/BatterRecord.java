package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BatterRecord {

    private Long playerId;
    private String playerName;
    private String teamName;
    private String emblemPath;

    private int rank;
    private String position;
    private int game;
    private int pa;
    private int ab;
    private int hits;
    private int doubles;
    private int triples;
    private int hr;
    private int tb;
    private int bb;
    private int ibb;
    private int hbp;
    private int so;
    private int sb;
    private int cs;
    private int runs;
    private int rbi;
    private int dp;
    private int sc;
    private int sf;

    private double avg;
    private double obp;
    private double slg;
    private double ops;
}
