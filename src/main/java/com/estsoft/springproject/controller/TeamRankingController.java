package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.TeamRanking;
import com.estsoft.springproject.domain.dto.TeamRankingDetail;
import com.estsoft.springproject.service.TeamRankingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.Year;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/teamranking")
public class TeamRankingController {

    private final TeamRankingService teamRankingService;

    @GetMapping("")
    public List<TeamRanking> getTeamRankingList(Year season) {

        return teamRankingService.getTeamRankingList(season);
    }

    @GetMapping("/detail")
    public String getTeamRankingDetail(@RequestParam(defaultValue = "#{T(java.time.Year).now()}") Year season,
                                       Model model) {

        List<TeamRankingDetail> teamRankingDetails = teamRankingService.getTeamRankingListDetail(season);

        model.addAttribute("previous", season.minusYears(1));
        model.addAttribute("season", season);
        model.addAttribute("next", season.plusYears(1));
        model.addAttribute("details", teamRankingDetails);

        return "teamRanking/detail";
    }
}
