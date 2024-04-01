package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.Year;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PitcherRecordDetail {

    private PlayerInfo player;

    private Year season;
    private String team;
    private int game;
    private int starter;
    private int complete;
    private int shutout;
    private int win;
    private int lose;
    private int hold;
    private int save;
    private String innings;
    private int runs;
    private int earnedRuns;
    private int tbf;
    private int hits;
    private int doubles;
    private int triples;
    private int hr;
    private int bb;
    private int ibb;
    private int hbp;
    private int so;
    private int np;

    private double whip;
    private double kNine;
    private double bbNine;
    private double hrNine;
    private double kbb;
    private double kp;
    private double bbp;
    private double era;
}
