package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.time.LocalDate;
import java.util.List;

@Mapper
public interface ScheduleMapper {

    List<Schedule> getMonthlySchedulesFindByTeamId(int year, int month, int teamId);
    List<Schedule> getMonthlySchedules(int year, int month);
    List<Schedule> getDailySchedules(String date);
}
