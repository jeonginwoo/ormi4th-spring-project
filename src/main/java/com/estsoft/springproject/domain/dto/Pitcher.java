package com.estsoft.springproject.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Pitcher {

    private PlayerInfo playerInfo;
    private List<PitcherRecordDetail> pitcherRecordDetails;
    private PitcherRecordDetail careerRecord;
}
