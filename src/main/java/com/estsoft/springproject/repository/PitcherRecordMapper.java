package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.PitcherRecord;
import com.estsoft.springproject.domain.dto.PitcherRecordDetail;
import org.apache.ibatis.annotations.Mapper;

import java.time.Year;
import java.util.List;

@Mapper
public interface PitcherRecordMapper {

    List<PitcherRecord> findByPlayerId(Long playerId);
    List<PitcherRecord> getPitchersRecord(Year season);
    List<PitcherRecordDetail> getPitcherRecordDetailOfAllSeason(Long playerId);
    PitcherRecordDetail getCareerRecord(Long playerId);
    List<PitcherRecord> getPitcherRecordOrderByQuery(String season, String query);
}
