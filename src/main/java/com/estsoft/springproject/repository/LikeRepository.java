package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.entity.Like;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LikeRepository extends JpaRepository<Like, Long> {
    void deleteByUserIdAndContentIdAndContentType(Long user_id, Long content_id, String content_type);

    Like findByUserIdAndContentIdAndContentType(Long user_id, Long content_id, String content_type);

    List<Like> findByContentIdAndContentType(Long content_id, String content_type);
}
