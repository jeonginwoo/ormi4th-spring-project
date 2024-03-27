package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.BatterLineup;
import com.estsoft.springproject.domain.dto.PitcherLineup;
import com.estsoft.springproject.service.LineupService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/lineup")
public class LineupController {

    private final LineupService lineupService;

    @GetMapping("/batter")
    public List<BatterLineup> getBatterLineup(String matchInfoId, int teamId) {

        return lineupService.getBatterLineup(matchInfoId, teamId);
    }

    @GetMapping("/pitcher")
    public List<PitcherLineup> getPitcherLineup(String matchInfoId, int teamId) {

        return lineupService.getPitcherLineup(matchInfoId, teamId);
    }
}
