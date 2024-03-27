package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.ScoreBoard;
import com.estsoft.springproject.service.ScoreBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/scoreboard")
public class ScoreBoardController {

    private final ScoreBoardService scoreBoardService;

    @GetMapping("")
    public ScoreBoard getScoreBoard(String id) {

        return scoreBoardService.getScoreBoard(id);
    }
}
