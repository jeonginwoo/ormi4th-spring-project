package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.PlayerInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PlayerMapper {

    PlayerInfo findById(Long id);
    List<PlayerInfo> findByTeamId(Long teamId);
}
