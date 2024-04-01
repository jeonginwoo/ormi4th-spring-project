package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Like;
import com.estsoft.springproject.domain.entity.User;
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
    public void deleteLike(Long user_id, Long board_id) {
        likeRepository.deleteByUser_IdAndBoard_Id(user_id, board_id);
    }

    public Like findLike(Long user_id, Long board_id) {
        return likeRepository.findByUser_IdAndBoard_Id(user_id, board_id);
    }

    public List<Like> findByBoardId(Long board_id) {
        return likeRepository.findByBoard_Id(board_id);
    }

    public List<Like> findAll() {
        return likeRepository.findAll();
    }
}
