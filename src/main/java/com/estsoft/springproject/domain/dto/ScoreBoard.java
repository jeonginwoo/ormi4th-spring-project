package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ScoreBoard {

    private String status;
    private String stadium;
    private String time;

    private String awayTeamName;
    private String awayEmblemPath;
    private int awayRuns;
    private String awayStats;

    private String homeTeamName;
    private String homeEmblemPath;
    private int homeRuns;
    private String homeStats;

    private String awayScore;
    private String homeScore;
}
