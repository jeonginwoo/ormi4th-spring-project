package com.estsoft.springproject.repository;

import java.util.List;

import com.estsoft.springproject.domain.entity.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface BoardRepository extends JpaRepository<Board, Long> {
	List<Board> findByUserNickname(String nickname);
	@Query("select b from Board b Where b.title LIKE %:title%")
	List<Board> findByTitle(String title);
}
