package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.BatterRecord;
import com.estsoft.springproject.domain.dto.PitcherRecord;
import com.estsoft.springproject.repository.BatterRecordMapper;
import com.estsoft.springproject.repository.PitcherRecordMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RecordService {

    private final BatterRecordMapper batterRecordMapper;
    private final PitcherRecordMapper pitcherRecordMapper;

    public List<BatterRecord> getBatterRecords(Long playerId) {

        return batterRecordMapper.findByPlayerId(playerId);
    }

    public List<PitcherRecord> getPitcherRecord(Long playerId) {

        return pitcherRecordMapper.findByPlayerId(playerId);
    }
}
