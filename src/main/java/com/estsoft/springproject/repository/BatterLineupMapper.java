package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.BatterLineup;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BatterLineupMapper {

    List<BatterLineup> getBatterLineup(String matchInfoId, int teamId);
}
