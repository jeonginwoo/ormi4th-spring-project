package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.Player;
import com.estsoft.springproject.service.PlayerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/player")
public class PlayerController {

    private final PlayerService playerService;

    @GetMapping("/{id}")
    public Player getPlayerInfo(@PathVariable Long id) {

        return playerService.getPlayerInfo(id);
    }

    @GetMapping("")
    public List<Player> getPlayersInfoByTeam(Long teamId) {

        return playerService.getPlayersInfoByTeam(teamId);
    }
}
