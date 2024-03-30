package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.domain.dto.TeamId;
import com.estsoft.springproject.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/schedule")
public class ScheduleController {

    private final ScheduleService scheduleService;

    @GetMapping("")
    public String getMonthlySchedules(@RequestParam(defaultValue = "#{T(java.time.LocalDate).now()}") LocalDate date,
                                      @RequestParam(required = false) String team,
                                      Model model) {

        List<Schedule> schedules = null;

        if(team != null) {
            int teamId = TeamId.valueOf(team).getId();
            schedules = scheduleService.getMonthlySchedules(date, teamId);
            model.addAttribute("team", team);
        }else {
            schedules = scheduleService.getMonthlySchedules(date);
        }

        model.addAttribute("date", date);
        model.addAttribute("schedules", schedules);

        return "schedule";
    }
}