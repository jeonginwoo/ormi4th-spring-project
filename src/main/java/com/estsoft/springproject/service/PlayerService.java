package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.Player;
import com.estsoft.springproject.repository.PlayerMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PlayerService {

    private final PlayerMapper playerMapper;

    public Player getPlayerInfo(Long id) {

        return playerMapper.findById(id);
    }

    public List<Player> getPlayersInfoByTeam(Long teamId) {

        return playerMapper.findByTeamId(teamId);
    }
}
