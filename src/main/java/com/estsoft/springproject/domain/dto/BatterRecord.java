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

    private String id;
    private Long playerId;
    private Long teamId;
    private String position;
    private int order;
    private int ab;
    private int hits;
    private int doubles;
    private int triples;
    private int hr;
    private int bb;
    private int ibb;
    private int hbp;
    private int so;
    private int sb;
    private int cs;
    private int runs;
    private int rbi;
    private int dp;
    private int sc;
    private int sf;
}
