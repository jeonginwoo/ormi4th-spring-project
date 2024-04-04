package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.entity.Like;
import com.estsoft.springproject.repository.LikeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LikeService {
    private final LikeRepository likeRepository;

    @Transactional
    public void addLike(Like like) {
        likeRepository.save(like);
    }

    @Transactional
    public void deleteLike(Long user_id, Long content_id, String content_type) {
        likeRepository.deleteByUserIdAndContentIdAndContentType(user_id, content_id, content_type);
    }

    public Like findLike(Long user_id, Long content_id, String content_type) {
        return likeRepository.findByUserIdAndContentIdAndContentType(user_id, content_id, content_type);
    }

    public List<Like> findByContent(Long content_id, String content_type) {
        return likeRepository.findByContentIdAndContentType(content_id, content_type);
    }
}
