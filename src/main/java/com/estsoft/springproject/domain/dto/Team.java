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
public class Team {

    private Long id;
    private String name;
    private String location;
    private String stadium;
    private Year foundationYear;
    private String emblemPath;
    private String teamColor;
}
