package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.domain.dto.TeamId;
import com.estsoft.springproject.service.ScheduleService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

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

        model.addAttribute("previous", previous(date));
        model.addAttribute("date", date);
        model.addAttribute("next",next(date));
        model.addAttribute("schedules", schedules);

        return "schedule";
    }

    @GetMapping("/daily")
    public String getDailySchedule(LocalDate date, Model model) {

        String d = date.toString();

        List<Schedule> schedules = scheduleService.getDailySchedules(d);

        model.addAttribute("schedules", schedules);
        model.addAttribute("date", date.format(DateTimeFormatter.ofPattern("MM.dd(E)", Locale.KOREAN)));
        model.addAttribute("previous", date.minusDays(1));
        model.addAttribute("next", date.plusDays(1));

        return "schedule/daily";
    }

    private LocalDate previous(LocalDate date) {

        return date.minusMonths(1).withDayOfMonth(1);
    }

    private LocalDate next(LocalDate date) {

        return date.plusMonths(1).withDayOfMonth(1);
    }
}