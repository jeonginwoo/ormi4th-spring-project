package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GameInfo {

    private String status;
    private String stadium;
    private String date;
    private String time;

    private String awayTeamName;
    private String awayEmblemPath;

    private String homeTeamName;
    private String homeEmblemPath;
}
