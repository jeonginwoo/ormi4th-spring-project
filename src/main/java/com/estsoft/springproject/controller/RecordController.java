package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.BatterRecord;
import com.estsoft.springproject.domain.dto.PitcherRecord;
import com.estsoft.springproject.service.RecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.Year;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/record")
public class RecordController {

    private final RecordService recordService;

    @GetMapping("/batter/{playerId}")
    public List<BatterRecord> getBatterRecords(@PathVariable Long playerId) {

        return recordService.getBatterRecords(playerId);
    }

    @GetMapping("/pitcher/{playerId}")
    public List<PitcherRecord> getPitcherRecords(@PathVariable Long playerId) {

        return recordService.getPitcherRecord(playerId);
    }

    @GetMapping("")
    public String getPlayersRecord(@RequestParam(defaultValue = "#{T(java.time.Year).now()}") Year season,
                                   @RequestParam(defaultValue = "pitcher") String type, Model model) {

        List<?> records = isPitcher(type) ?
                recordService.getPitchersRecord(season) : recordService.getBattersRecord(season);

        model.addAttribute("previous", season.minusYears(1));
        model.addAttribute("season", season);
        model.addAttribute("next", season.plusYears(1));
        model.addAttribute("type", type);
        model.addAttribute("records", records);

        return "record";
    }

    private boolean isPitcher(String type) {

        return type.equals("pitcher");
    }
}
