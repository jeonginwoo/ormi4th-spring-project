package com.estsoft.springproject.domain.dto;

import org.antlr.v4.runtime.atn.SemanticContext;

import java.util.HashMap;
import java.util.Map;

public enum TeamId {

    두산(1, "#131230","두산 베어스"),
    LG(2, "#C30452", "LG 트윈스"),
    삼성(3, "#074CA1", "삼성 라이온즈"),
    한화(4, "#FF6600", "한화 이글스"),
    KIA(5, "#EA0029", "KIA 타이거즈"),
    키움(6, "#570514", "키움 히어로즈"),
    KT(7, "#000000", "KT 위즈"),
    롯데(8, "#041E42", "롯데 자이언츠"),
    NC(9, "#315288", "NC 다이노스"),
    SSG(10, "#CE0E2D", "SSG 랜더스");
    private int id;
    private String color;
    private String fullName;

    private TeamId(int id, String color, String fullName) {

        this.id = id;
        this.color = color;
        this.fullName = fullName;
    }

    public int getId() {

        return id;
    }

    public String getColor() {

        return color;
    }
    public String getFullName() {

        return fullName;
    }

    public String getTeamNameById(int id) {

        for(TeamId teamId : TeamId.values()) {

            if(teamId.getId() == id) {
                return teamId.name();
            }
        }

        return null;
    }
}
