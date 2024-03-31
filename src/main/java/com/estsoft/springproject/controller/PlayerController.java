package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.PlayerInfo;
import com.estsoft.springproject.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/player")
public class PlayerController {

    private final PlayerService playerService;

    @GetMapping("/{id}")
    public PlayerInfo getPlayerInfo(@PathVariable Long id) {

        return playerService.getPlayerInfo(id);
    }

    @GetMapping("")
    public List<PlayerInfo> getPlayersInfoByTeam(Long teamId) {

        return playerService.getPlayersInfoByTeam(teamId);
    }

    @GetMapping("/info")
    public String getPlayerInfoWithSeasonRecord(Long id, Long positionId, Model model) {

        Object player = isPitcher(positionId) ?
                playerService.getPitcherInfoWithAllSeasonRecord(id) : playerService.getBatterInfoWithAllSeasonRecord(id);

        model.addAttribute("positionId", positionId);
        model.addAttribute("player", player);

        return "/player/info";
    }

    private boolean isPitcher(Long positionId) {

        return positionId == 1;
    }
}
