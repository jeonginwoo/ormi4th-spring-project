package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.repository.ScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;

    public List<Schedule> getSchedules(String month){

        return scheduleMapper.getSchedules(month);
    }
}
