package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.ScoreBoard;
import com.estsoft.springproject.repository.ScoreBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ScoreBoardService {

    private final ScoreBoardMapper scoreBoardMapper;

    public ScoreBoard getScoreBoard(String id) {

        return scoreBoardMapper.findById(id);
    }
}
