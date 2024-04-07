package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Player {

    private Long id;
    private int teamId;
    private String name;
    private LocalDate birth;
    private String hand;
    private int uniformNumber;
    private String photoPath;
}
