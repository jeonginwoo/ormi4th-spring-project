package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.GameResult;
import com.estsoft.springproject.service.GameResultService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("/gameresult")
public class GameResultController {

    private final GameResultService gameResultService;

    @GetMapping("")
    public String getGameResult(String gameCode, Model model) {

        GameResult gameResult = gameResultService.getGameResult(gameCode);

        model.addAttribute("result", gameResult);
        model.addAttribute("gameCode", gameCode);

        return "gameResult";
    }
}
