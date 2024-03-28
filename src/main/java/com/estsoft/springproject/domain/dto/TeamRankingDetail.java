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
public class TeamRankingDetail {

    private Year season;
    private int rank;
    private int teamId;
    private String teamName;
    private int game;
    private int win;
    private int lose;
    private int draw;
    private String emblemPath;

    private double winPercent;
    private double winMargin;

    private double teamAVG;
    private double teamOBP;
    private double teamSLG;
    private double teamOPS;
    private int teamHR;

    private double teamERA;
}
