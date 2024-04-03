package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class GameResult {

    List<Schedule> dailySchedules;
    GameInfo gameInfo;
    ScoreBoard scoreBoard;
    List<BatterLineup> awayBatterLineup;
    List<BatterLineup> homeBatterLineup;
    List<PitcherLineup> awayPitcherLineup;
    List<PitcherLineup> homePitcherLineup;
}
