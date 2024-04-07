package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.PitcherLineup;
import com.estsoft.springproject.domain.dto.StartingPlayer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PitcherLineupMapper {

    List<PitcherLineup> getPitcherLineup(String matchInfoId, int teamId);
    int registerLineup(List<StartingPlayer> lineup);
    List<StartingPlayer> getPlayersRegisteredLineup(String matchInfoId, int teamId);
    int registerLineupForSingle(StartingPlayer startingPlayer);
}
