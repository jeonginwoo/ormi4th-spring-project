package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;

    public Board save(BoardRequest request, User user) {
        return boardRepository.save(new Board(request, user));
    }

    public Page<Board> findAll(int page) {
        List<Sort.Order> sorts = new ArrayList<>();
        sorts.add(Sort.Order.desc("createdAt"));
        Pageable pageable = PageRequest.of(page - 1, 10, Sort.by(sorts));
        return this.boardRepository.findAll(pageable);
    }

    public Board findById(Long id) {
        return boardRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("not found id" + id));
    }

    public void deleteById(Long id) {
        boardRepository.deleteById(id);
    }

    public Board update(Long id, BoardRequest request) {
        Board updated = findById(id);
        updated.update(request.getTitle(), request.getContent());
        boardRepository.save(updated);
        return updated;
    }
    public List<Board> findByUserNickName(String nickname){
        return boardRepository.findByUserNickname(nickname);
    }

    public List<Board> findByTitle(String title){
        return boardRepository.findByTitle(title);
    }
}