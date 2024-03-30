package com.estsoft.springproject.domain.dto;

public enum TeamId {

    두산(1),
    LG(2),
    삼성(3),
    한화(4),
    KIA(5),
    키움(6),
    KT(7),
    롯데(8),
    NC(9),
    SSG(10);

    private int id;

    private TeamId(int id) {

        this.id = id;
    }

    public int getId() {
        return id;
    }
}
