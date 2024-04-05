package com.estsoft.springproject.service;

import java.util.List;
import java.util.Optional;

import com.estsoft.springproject.domain.dto.UserRequest;
import com.estsoft.springproject.domain.dto.UserResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.repository.BoardRepository;
import com.estsoft.springproject.repository.CommentRepository;
import com.estsoft.springproject.repository.UserRepository;
import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService implements UserDetailsService {

    private final UserRepository userRepository;
    private final BoardRepository boardRepository;
    private final CommentRepository commentRepository;
    private BCryptPasswordEncoder encoder;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    public UserService(UserRepository userRepository, BoardRepository boardRepository,
        CommentRepository commentRepository,
        BCryptPasswordEncoder encoder) {
        this.userRepository = userRepository;
        this.boardRepository = boardRepository;
        this.commentRepository = commentRepository;
        this.encoder = encoder;
    }


    public User findById(Long id) {
        return userRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("not found id" + id));
    }
    public UserResponse getUserMypageInfo(Long userId){
        User user = userRepository.findById(userId).orElseThrow(()-> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));
        return new UserResponse(user);
    }

    public void updateUserInfo(Long userId,UserRequest userRequest){
        User user = userRepository.findById(userId).orElseThrow(()-> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));
        String encodedPassword = passwordEncoder.encode(userRequest.getPassword());
        user.update(userRequest.getEmail(), userRequest.getNickname(), encodedPassword);
        userRepository.save(user);
    }
    public void deleteUserInfo(Long userId){
        User user = userRepository.findById(userId).orElseThrow(()-> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));
        userRepository.delete(user);
    }

    public Page<Board> getUserBoardsPaged(Long userId, int page) {
        int pageSize = 10; // 한 페이지에 표시할 게시글 수
        Pageable pageable = PageRequest.of(page - 1, pageSize);
        return boardRepository.findByUserId(userId, pageable);
    }

    public Page<Comment> getUserCommentsPaged(Long userId, int page) {
        int pageSize = 10; // 한 페이지에 표시할 댓글 수
        Pageable pageable = PageRequest.of(page - 1, pageSize);
        return commentRepository.findByUserId(userId, pageable);
    }
    public List<User> getAllUser(){
        return userRepository.findAll();
    }
    public void updateRole(Long userId,String role){
        User user = userRepository.findById(userId).orElseThrow(()-> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));
        user.updateRole(role);
    }
    public int getTotalUsers(){
        return (int)userRepository.count();
    }

    //spring security 부분
    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        return userRepository.findByEmail(email)
            .orElseThrow(() -> new IllegalArgumentException(email));
    }
    //회원가입 - 회원정보 추가 기능
    public User save(UserRequest dto){
        String encodedPassword = encoder.encode(dto.getPassword());
        return userRepository.save(User.builder().email(dto.getEmail())
            .password(encodedPassword)
            .nickname(dto.getNickname())
            .role("user").build());
    }

    public boolean isNicknameAvailable(String nickname) {
        Optional<User> user = userRepository.findByNickname(nickname);
        return !user.isPresent(); // 사용 가능한 닉네임이면 true, 이미 사용 중이면 false 반환
    }

    public boolean checkCurrentPassword(String currentPassword) {
        // 현재 로그인된 사용자의 정보 가져오기
        Optional<User> currentUserOptional = getCurrentUser();

        // Optional에서 User 객체를 가져와서 비밀번호를 확인
        if (currentUserOptional.isPresent()) {
            User currentUser = currentUserOptional.get();
            // System.out.println("현재 입력한 비밀번호: " + currentPassword);
            // System.out.println("현재 사용자의 비밀번호: " + currentUser.getPassword());
            return passwordEncoder.matches(currentPassword.trim(), currentUser.getPassword());
        } else {
            throw new IllegalStateException("현재 사용자 정보를 가져올 수 없습니다.");
        }
    }

    private Optional<User> getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        String email = userDetails.getUsername(); // 이메일을 사용하여 사용자를 찾음
        return userRepository.findByEmail(email);
    }


}
