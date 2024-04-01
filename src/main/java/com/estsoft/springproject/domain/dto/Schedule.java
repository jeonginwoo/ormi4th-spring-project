package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Schedule {

    private String id;
    private Timestamp matchDate;
    private int awayTeamId;
    private int homeTeamId;
    private String awayTeamName;
    private String homeTeamName;
    private String stadium;
    private String broadcast;
    private String status;
    private String awayTeamEmblemPath;
    private String homeTeamEmblemPath;
    private int awayTeamRuns;
    private int homeTeamRuns;
    private String awayStarter;
    private String homeStarter;
}
