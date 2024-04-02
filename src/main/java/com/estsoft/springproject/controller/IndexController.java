package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.BatterRecord;
import com.estsoft.springproject.domain.dto.Schedule;
import com.estsoft.springproject.domain.dto.TeamRanking;
import com.estsoft.springproject.service.RecordService;
import com.estsoft.springproject.service.ScheduleService;
import com.estsoft.springproject.service.TeamRankingService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Locale;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final TeamRankingService teamRankingService;
    private final ScheduleService scheduleService;
    private final RecordService recordService;

    @GetMapping("")
    public String index(Model model) {

        LocalDate currentDate = LocalDate.now();

        Year season = Year.of(currentDate.getYear());
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        String date = currentDate.format(formatter);

        List<TeamRanking> teamRanking = teamRankingService.getTeamRankingList(season);
        List<Schedule> schedules = scheduleService.getDailySchedules(date);
        List<BatterRecord> records = recordService.getBatterRecordOrderByAVG(season.toString());

        model.addAttribute("teamRanking", teamRanking);
        model.addAttribute("schedules", schedules);
        model.addAttribute("records", records);

        model.addAttribute("date", currentDate.format(DateTimeFormatter.ofPattern("MM.dd(E)", Locale.KOREAN)));
        model.addAttribute("previous", currentDate.minusDays(1));
        model.addAttribute("next", currentDate.plusDays(1));

        return "index";
    }
}
