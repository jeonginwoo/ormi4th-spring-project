package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.Schedule;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ScheduleMapper {

    List<Schedule> getMonthlySchedules(String month);
    List<Schedule> getDailySchedules(String date);
}
