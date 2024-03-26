package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("")
    public List<Schedule> getSchedules(String month) {

        return scheduleService.getSchedules(month);
    }
}
