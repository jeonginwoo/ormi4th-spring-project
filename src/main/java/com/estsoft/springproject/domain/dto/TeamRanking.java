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
public class TeamRanking {

    private String id;
    private Year season;
    private int rank;
    private int teamId;
    private String teamName;
    private int game;
    private int win;
    private int lose;
    private int draw;
    private String emblemPath;
}
