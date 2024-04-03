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

    private int awayRuns;
    private String awayStats;
    private String awayScore;

    private int homeRuns;
    private String homeStats;
    private String homeScore;
}
