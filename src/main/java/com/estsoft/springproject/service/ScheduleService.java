package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.repository.ScheduleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ScheduleService {

    private final ScheduleMapper scheduleMapper;

    public List<Schedule> getMonthlySchedules(LocalDate date){

        int year = date.getYear();
        int month = date.getMonthValue();

        return scheduleMapper.getMonthlySchedules(year, month);
    }

    public List<Schedule> getMonthlySchedules(LocalDate date, int teamId){

        int year = date.getYear();
        int month = date.getMonthValue();

        return scheduleMapper.getMonthlySchedulesFindByTeamId(year, month, teamId);
    }

    public List<Schedule> getDailySchedules(String date) {

        return scheduleMapper.getDailySchedules(date);
    }
}
