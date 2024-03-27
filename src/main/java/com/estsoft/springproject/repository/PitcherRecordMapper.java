package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.PitcherRecord;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PitcherRecordMapper {

    List<PitcherRecord> findByPlayerId(Long playerId);
}
