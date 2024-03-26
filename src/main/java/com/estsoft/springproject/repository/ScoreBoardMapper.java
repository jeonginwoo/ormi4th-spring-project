package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.ScoreBoard;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScoreBoardMapper {

    ScoreBoard findById(String id);
}
