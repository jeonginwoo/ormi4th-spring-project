package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.BatterLineup;
import com.estsoft.springproject.domain.dto.GameResult;
import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.domain.dto.ScoreBoard;
import com.estsoft.springproject.repository.BatterLineupMapper;
import com.estsoft.springproject.repository.PitcherLineupMapper;
import com.estsoft.springproject.repository.ScheduleMapper;
import com.estsoft.springproject.repository.ScoreBoardMapper;
import lombok.Builder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class GameResultService {

    private final ScheduleMapper scheduleMapper;
    private final ScoreBoardMapper scoreBoardMapper;
    private final BatterLineupMapper batterLineupMapper;
    private final PitcherLineupMapper pitcherLineupMapper;

    public GameResult getGameResult(String gameCode) {

        String matchDate = gameCode.substring(0, 8);
        int awayTeamId = gameCode.charAt(8) - '0' + 1;
        int homeTeamId = gameCode.charAt(9) - '0' + 1;

        GameResult gameResult = GameResult.builder()
                .dailySchedules(scheduleMapper.getDailySchedules(matchDate))
                .scoreBoard(scoreBoardMapper.findById(gameCode))
                .awayBatterLineup(batterLineupMapper.getBatterLineup(gameCode, awayTeamId))
                .homeBatterLineup(batterLineupMapper.getBatterLineup(gameCode, homeTeamId))
                .awayPitcherLineup(pitcherLineupMapper.getPitcherLineup(gameCode, awayTeamId))
                .homePitcherLineup(pitcherLineupMapper.getPitcherLineup(gameCode, homeTeamId))
                .build();

        return gameResult;
    }
}
