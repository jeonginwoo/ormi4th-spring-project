package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.Player;
import com.estsoft.springproject.domain.dto.PlayerInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlayerMapper {

    PlayerInfo findById(Long id);
    List<Player> findByTeamId(Long teamId);
    List<Player> findByTeamIdExcludingRegisteredLineup(Long teamId, String matchInfoId);
}
