package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.BatterRecord;
import com.estsoft.springproject.domain.dto.BatterRecordDetail;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BatterRecordMapper {

    List<BatterRecord> findByPlayerId(Long playerId);
    List<BatterRecord> getBatterRecordOrderByAVG(String season);
    List<BatterRecordDetail> getBatterRecordDetailOfAllSeason(Long playerId);
    BatterRecordDetail getCareerRecord(Long playerId);
}
