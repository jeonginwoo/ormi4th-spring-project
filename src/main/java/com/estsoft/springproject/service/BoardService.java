package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.Board;
import com.estsoft.springproject.domain.User;
import com.estsoft.springproject.dto.BoardRequest;
import com.estsoft.springproject.repository.BoardRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    private final BoardRepository boardRepository;

    public BoardService(BoardRepository boardRepository) {
        this.boardRepository = boardRepository;
    }

    public Board save(BoardRequest request, User user) {
        return boardRepository.save(new Board(request, user));
    }

    public List<Board> findAll() {
        return boardRepository.findAll();
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
}