package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Like;
import com.estsoft.springproject.domain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LikeRepository extends JpaRepository<Like, Long> {
    void deleteByUser_IdAndBoard_Id(Long user_id, Long board_id);

    Like findByUser_IdAndBoard_Id(Long user_id, Long board_id);

    List<Like> findByBoard_Id(Long board_id);
}
