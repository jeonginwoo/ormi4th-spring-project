package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    public User findById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("not found id" + id));
    }
}
