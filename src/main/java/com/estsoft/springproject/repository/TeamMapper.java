package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.dto.Team;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamMapper {

    Team findById(Long id);
}
