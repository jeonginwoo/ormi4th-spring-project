package com.estsoft.springproject.controller;

import com.estsoft.springproject.domain.dto.BatterRecord;
import com.estsoft.springproject.domain.dto.PitcherRecord;
import com.estsoft.springproject.service.RecordService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
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
}
