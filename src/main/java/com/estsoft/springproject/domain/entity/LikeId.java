package com.estsoft.springproject.domain.entity;

import java.io.Serializable;
import java.util.Objects;

public class LikeId implements Serializable {
    private User user;
    private Long contentId;
    private String contentType;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LikeId likeId = (LikeId) o;
        return Objects.equals(user, likeId.user) &&
                Objects.equals(contentId, likeId.contentId) &&
                Objects.equals(contentType, likeId.contentType);
    }

    @Override
    public int hashCode() {
        return Objects.hash(user, contentId, contentType);
    }
}

