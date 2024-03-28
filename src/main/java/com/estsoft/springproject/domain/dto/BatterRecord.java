package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BatterRecord {

    private Long playerId;
    private String playerName;
    private String teamName;
    private String emblemPath;

    private int hits;
    private int hr;
    private int rbi;
    private double avg;
}
