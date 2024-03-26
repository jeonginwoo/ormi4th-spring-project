package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.domain.dto.BoardRequest;
import com.estsoft.springproject.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BoardService {
    private final BoardRepository boardRepository;

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
    public List<Board> findByUserNickName(String nickname){
        return boardRepository.findByUserNickname(nickname);
    }

    public List<Board> findByTitle(String title){
        return boardRepository.findByTitle(title);
    }
}