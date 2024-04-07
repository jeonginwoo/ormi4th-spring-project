package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.BatterLineup;
import com.estsoft.springproject.domain.dto.PitcherLineup;
import com.estsoft.springproject.domain.dto.StartingPlayer;
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

    public List<StartingPlayer> getPlayersRegisteredLineup(String matchInfoId, int teamId) {

        return batterLineupMapper.getPlayersRegisteredLineup(matchInfoId, teamId);
    }

    public int submitBatterLineup(List<StartingPlayer> lineup, String team) {

        return batterLineupMapper.registerLineup(checkPrimaryKey(lineup, team));
    }


    public void submitPitcherLineup(List<StartingPlayer> lineup, String team) {

    }

    private List<StartingPlayer> checkPrimaryKey(List<StartingPlayer> lineup, String team) {

        for(StartingPlayer player : lineup) {

            if(player.getId() != null) {
                continue;
            }

            StringBuilder builder = new StringBuilder();

            String matchDate = player.getMatchInfoId().substring(0,8);
            builder.append(matchDate).append(team).append(player.getOrder());

            if(isPinchHitter(player.getPositionId())) {
                builder.append(player.getPositionId() - 10);
            }

            player.setId(builder.toString());
        }

        return lineup;
    }

    private boolean isPinchHitter(int positionId) {

        return positionId >= 11;
    }
}
