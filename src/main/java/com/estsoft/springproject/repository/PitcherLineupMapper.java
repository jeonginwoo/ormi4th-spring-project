package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.PitcherLineup;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PitcherLineupMapper {

    List<PitcherLineup> getPitcherLineup(String matchInfoId, int teamId);
}
