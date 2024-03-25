package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.Team;
import com.estsoft.springproject.repository.TeamMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class TeamService {

    private final TeamMapper teamMapper;

    public Team getTeamInfo(Long id) {

        return teamMapper.findById(id);
    }
}
