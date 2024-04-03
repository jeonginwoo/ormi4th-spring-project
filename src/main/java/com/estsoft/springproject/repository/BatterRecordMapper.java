package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.BatterRecord;
import com.estsoft.springproject.domain.dto.BatterRecordDetail;
import org.apache.ibatis.annotations.Mapper;

import java.time.Year;
import java.util.List;

@Mapper
public interface BatterRecordMapper {

    List<BatterRecord> findByPlayerId(Long playerId);
    List<BatterRecord> getBatterRecordOrderByQuery(String season, String query);
    List<BatterRecord> getBattersRecord(Year season);
    List<BatterRecordDetail> getBatterRecordDetailOfAllSeason(Long playerId);
    BatterRecordDetail getCareerRecord(Long playerId);
}
