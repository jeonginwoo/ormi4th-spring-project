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

    private String id;
    private int awayRuns;
    private int awayHits;
    private int awayError;
    private int awayBB;
    private int homeRuns;
    private int homeHits;
    private int homeError;
    private int homeBB;
    private String awayScore;
    private String homeScore;
}
