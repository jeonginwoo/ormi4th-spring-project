package com.estsoft.springproject.repository;

import java.util.List;

import com.estsoft.springproject.domain.entity.Board;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {
  	Page<Board> findAll(Pageable pageable);
	Page<Board> findByUserNickname(String nickname,Pageable pageable);
	@Query("select b from Board b Where b.title LIKE %:title%")
	Page<Board> findByTitle(String title,Pageable pageable);
}
