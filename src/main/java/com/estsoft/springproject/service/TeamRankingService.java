package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.TeamRanking;
import com.estsoft.springproject.domain.dto.TeamRankingDetail;
import com.estsoft.springproject.repository.TeamRankingMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.Year;
import java.util.List;

@Service
@RequiredArgsConstructor
public class TeamRankingService {

    private final TeamRankingMapper teamRankingMapper;

    public List<TeamRanking> getTeamRankingList(Year season) {

        return teamRankingMapper.findBySeason(season);
    }

    public List<TeamRankingDetail> getTeamRankingListDetail(Year season) {

        return teamRankingMapper.findDetailBySeason(season);
    }
}
