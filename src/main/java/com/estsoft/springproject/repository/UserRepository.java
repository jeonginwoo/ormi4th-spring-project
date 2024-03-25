package com.estsoft.springproject.repository;

import com.estsoft.springproject.domain.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
