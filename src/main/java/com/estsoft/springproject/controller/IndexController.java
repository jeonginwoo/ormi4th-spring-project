package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.TeamRanking;
import com.estsoft.springproject.service.TeamRankingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.Year;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final TeamRankingService teamRankingService;

    @GetMapping("")
    public String index(Model model) {

        Year season = Year.of(LocalDate.now().getYear());

        List<TeamRanking> teamRanking = teamRankingService.getTeamRankingList(season);

        model.addAttribute("teamRanking", teamRanking);

        return "index";
    }
}
