package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class PlayerInfo {

    private Long id;
    private String name;
    private String currentTeam;
    private String emblemPath;
    private String teamColor;
    private Date birth;
    private String position;
    private String hand;
    private int uniformNumber;
    private String photoPath;
}
