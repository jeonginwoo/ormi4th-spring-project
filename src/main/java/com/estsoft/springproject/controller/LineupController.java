package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.*;
import com.estsoft.springproject.service.LineupService;
import com.estsoft.springproject.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/lineup")
public class LineupController {

    private final LineupService lineupService;
    private final PlayerService playerService;

    @GetMapping("/batter")
    public List<BatterLineup> getBatterLineup(String matchInfoId, int teamId) {

        return lineupService.getBatterLineup(matchInfoId, teamId);
    }

    @GetMapping("/pitcher")
    public List<PitcherLineup> getPitcherLineup(String matchInfoId, int teamId) {

        return lineupService.getPitcherLineup(matchInfoId, teamId);
    }

    @GetMapping("/create")
    public String createLineup(Model model, String gameCode, String team, String type) {

        List<StartingPlayer> registeredPlayers = lineupService.getPlayersRegisteredLineup(gameCode, TeamId.valueOf(team).getId(), type);
        List<Player> players = playerService.getPlayersExcludeRegisteredLineup((long) TeamId.valueOf(team).getId(), gameCode);

        model.addAttribute("registered", registeredPlayers);
        model.addAttribute("players", players);
        model.addAttribute("fullName", TeamId.valueOf(team).getFullName());
        model.addAttribute("color", TeamId.valueOf(team).getColor());
        model.addAttribute("gameCode", gameCode);
        model.addAttribute("type", type);
        model.addAttribute("team",team);

        return "startingLineup";
    }

    @PostMapping("/submit")
    public ResponseEntity<?> submitLineup(@RequestBody List<StartingPlayer> lineup,
                                          String type, String team) {

        try{

            if(isPitcher(type)) {
                lineupService.submitPitcherLineup(lineup, team);
            } else {
                lineupService.submitBatterLineup(lineup, team);
            }

            return ResponseEntity.ok("라인업 등록 성공");

        }catch (Exception e) {

            String errorMessage = "라인업 등록 실패: " + e.getMessage();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(errorMessage);
        }
    }

    private boolean isPitcher(String type) {

        return "pitcher".equals(type);
    }
}
