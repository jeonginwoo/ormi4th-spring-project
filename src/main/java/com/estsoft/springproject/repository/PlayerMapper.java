package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.Player;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlayerMapper {

    Player findById(Long id);
    List<Player> findByTeamId(Long teamId);
}
