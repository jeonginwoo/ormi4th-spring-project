package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.Team;
import com.estsoft.springproject.service.TeamService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/team")
public class TeamController {

    private final TeamService teamService;

    @GetMapping("")
    public Team getTeamInfo(Long id) {

        return teamService.getTeamInfo(id);
    }
}
