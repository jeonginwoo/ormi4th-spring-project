package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.BatterLineup;
import com.estsoft.springproject.domain.dto.StartingPlayer;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BatterLineupMapper {

    List<BatterLineup> getBatterLineup(String matchInfoId, int teamId);
    List<StartingPlayer> getPlayersRegisteredLineup(String matchInfoId, int teamId);
    int registerLineup(List<StartingPlayer> lineup);
    int registerLineupForSingle(StartingPlayer startingPlayer);
    int deleteLineupByMatchId(String matchInfoId, int teamId);
}
