package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.TeamRanking;
import org.apache.ibatis.annotations.Mapper;

import java.time.Year;
import java.util.List;

@Mapper
public interface TeamRankingMapper {

    List<TeamRanking> findBySeason(Year season);
}
