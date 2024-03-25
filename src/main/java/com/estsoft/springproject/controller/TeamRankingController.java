package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.TeamRanking;
import com.estsoft.springproject.service.TeamRankingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.Year;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/teamRanking")
public class TeamRankingController {

    private final TeamRankingService teamRankingService;

    @GetMapping("")
    public List<TeamRanking> getTeamRankingList(Year season) {

        return teamRankingService.getTeamRankingList(season);
    }
}
