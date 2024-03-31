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
public class BatterRecordDetail {

    private PlayerInfo player;

    private Year season;
    private String team;
    private String position;
    private int age;
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
