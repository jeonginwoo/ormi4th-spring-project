package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.BatterLineup;
import com.estsoft.springproject.domain.dto.PitcherLineup;
import com.estsoft.springproject.repository.BatterLineupMapper;
import com.estsoft.springproject.repository.PitcherLineupMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class LineupService {

    private final BatterLineupMapper batterLineupMapper;
    private final PitcherLineupMapper pitcherLineupMapper;

    public List<BatterLineup> getBatterLineup(String matchInfoId, int teamId) {

        return batterLineupMapper.getBatterLineup(matchInfoId, teamId);
    }

    public List<PitcherLineup> getPitcherLineup(String matchInfoId, int teamId) {

        return pitcherLineupMapper.getPitcherLineup(matchInfoId, teamId);
    }
}
