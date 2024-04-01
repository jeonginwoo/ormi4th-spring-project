package com.estsoft.springproject.domain.entity;

import java.io.Serializable;
import java.util.Objects;

// Like 테이블의 복합키 정의
public class LikeId implements Serializable {

    private User user;
    private Board board;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof LikeId likeId)) return false;
        return Objects.equals(user, likeId.user) && Objects.equals(board, likeId.board);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user, board);
    }
}
