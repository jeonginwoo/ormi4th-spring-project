package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {
    List<Comment> findByBoard_IdAndParentNull(Long boardId);
    List<Comment> findByParent_Id(Long boardId);
    Page<Comment> findByUserNickname(String nickname, Pageable pageable);
    Page<Comment> findByUserId(Long userId,Pageable pageable);
}
