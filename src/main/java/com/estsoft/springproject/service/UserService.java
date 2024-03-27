package com.estsoft.springproject.service;

import com.estsoft.springproject.domain.dto.UserResponse;
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
    public UserResponse getUserMypageInfo(Long userId){
        User user = userRepository.findById(userId).orElseThrow(()-> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));
        return new UserResponse(user);
    }
}
