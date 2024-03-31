package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PitcherRecord {

    private Long playerId;
    private String playerName;
    private String teamName;
    private String emblemPath;

    private int win;
    private int save;
    private int so;
    private double era;
}
