package com.estsoft.springproject.controller;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.estsoft.springproject.domain.dto.UserAdminResponse;
import com.estsoft.springproject.domain.dto.UserRequest;
import com.estsoft.springproject.domain.dto.UserResponse;
import com.estsoft.springproject.domain.entity.Board;
import com.estsoft.springproject.domain.entity.Comment;
import com.estsoft.springproject.domain.entity.User;
import com.estsoft.springproject.service.BoardService;
import com.estsoft.springproject.service.CommentService;
import com.estsoft.springproject.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@RequiredArgsConstructor
public class UserController {
	private final UserService userService;
	private final BoardService boardService;
	private final CommentService commentService;
	@Autowired
	private PasswordEncoder passwordEncoder;

	// @GetMapping("/mypage/{userId}")
	// public String showUserMypage(@PathVariable Long userId, Model model,
	// 	@RequestParam(value = "boardPage", defaultValue = "1") int boardPage,
	// 	@RequestParam(value = "commentPage", defaultValue = "1") int commentPage) {
	// 	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	// 	String username = authentication.getName(); // 현재 인증된 사용자의 이름을 가져옴
	// 	Page<Board> boardPageResult = userService.getUserBoardsPaged(userId, boardPage);
	// 	Page<Comment> commentPageResult = userService.getUserCommentsPaged(userId, commentPage);
	// 	User user = userService.findById(userId);
	// 	model.addAttribute("boardPage", boardPageResult);
	// 	model.addAttribute("commentPage", commentPageResult);
	// 	model.addAttribute("user",user);
	// 	return "test/mypage"+userId;
	// }
	@GetMapping("/mypage")
	public String myPage(@RequestParam(defaultValue = "1") int boardPage,@RequestParam(defaultValue = "1") int commentPage, Model model, @AuthenticationPrincipal UserDetails userDetails) {

		if (userDetails != null) {
			Long userId = getUserIdFromUserDetails(userDetails);
			if (userId != null) {
				Page<Board> boardPageResult = userService.getUserBoardsPaged(userId, boardPage);
				Page<Comment> commentPageResult = userService.getUserCommentsPaged(userId, commentPage);
				User user = userService.findById(userId);
				model.addAttribute("boardPage", boardPageResult);
				model.addAttribute("commentPage", commentPageResult);
				model.addAttribute("user", user);
				model.addAttribute("userName",user.getNickname());
				return "test/mypage";
			}
		}
		// 사용자를 찾을 수 없거나 인증되지 않은 경우, 로그인 페이지로 리다이렉트 또는 다른 처리
		return "redirect:/login";
	}


	private Long getUserIdFromUserDetails(UserDetails userDetails) {
		if (userDetails instanceof User) {
			return ((User) userDetails).getId();
		}
		return null;
	}


	@GetMapping("/mypage/update/{userId}")
	public String showUpdateForm(@PathVariable("userId") Long userId, Model model) {
		User user = userService.findById(userId); // 사용자 ID로 사용자 정보 조회
		model.addAttribute("user", user); // 모델에 사용자 정보 추가
		return "edit"; // edit.html 페이지로 이동
	}
	@Transactional
	@PutMapping("/mypage/update/{userId}")
	public String updateMypageInfo(@PathVariable Long userId,@ModelAttribute UserRequest userRequest,Model model,
		BindingResult bindingResult){
		if (bindingResult.hasErrors()) {
			return "edit";
		}
		User user = userService.findById(userId);


		//닉네임 처리
		if (!user.getNickname().equals(userRequest.getNickname())) {
			boolean nicknameExists = userService.isNicknameAvailable(userRequest.getNickname());
			if (!nicknameExists) {
				bindingResult.rejectValue("nickname", "error.userRequest", "이미 사용 중인 닉네임입니다.");
				return "edit";
			}
		}

		//현재 비밀번호 처리
		String encodedPassword = passwordEncoder.encode(userRequest.getPassword());
		if(!passwordEncoder.matches(userRequest.getCurrentPassword(),user.getPassword())){
			bindingResult.rejectValue("currentPassword","error.userRequest","비밀번호가 맞지 않습니다.");
			return "edit";
		}
		//새로운 비밀번호 입력 처리
		else{
			Pattern passwordPattern = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&~]{8,}$");
			if (!passwordPattern.matcher(userRequest.getPassword()).matches()) {
				bindingResult.rejectValue("password", "error.userRequest", "비밀번호는 영어소문자, 숫자, 특수문자를 포함하여 8자 이상이어야 합니다.");
				return "edit";
			}
		}

		userService.updateUserInfo(userId,userRequest);
		model.addAttribute("user",user);
		return "redirect:/mypage";
	}

	@DeleteMapping("/mypage/{userId}")
	public String deleteUserInfo(@PathVariable Long userId){
		userService.deleteUserInfo(userId);
		return "redirect:/login";
	}

	@GetMapping("mypage/admin")
	public String getAllUsers(Model model,@AuthenticationPrincipal UserDetails userDetails){

		Long id = getUserIdFromUserDetails(userDetails);
		User user = userService.findById(id);
		int totalUsers = userService.getTotalUsers();
		model.addAttribute("totalUsers",totalUsers);
		int totalPosts = boardService.getTotalPosts();
		model.addAttribute("totalPosts",totalPosts);
		int totalComments = commentService.getTotalComments();
		model.addAttribute("totalComments",totalComments);
		if(user.getRole().equals("admin")){
			List<UserAdminResponse> users = userService.getAllUser().stream().map(UserAdminResponse::new).toList();
			model.addAttribute("users",users);
			return "admin";
		}
		else{
			return "redirect:/mypage";
		}

	}
	@Transactional
	@PostMapping("mypage/{userId}/admin")
	public String updateRole(@PathVariable Long userId,@RequestParam String role){
		userService.updateRole(userId,role);
		return "redirect:/mypage/admin";
	}

	// spring security 관련 코드
	// 회원가입 컨트롤러
	//@PostMapping("/user")
	//public String signup(UserRequest request){
		//userService.save(request);
		//return "redirect:/login";
	//}
	//로그아웃 컨트롤러
	@GetMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		new SecurityContextLogoutHandler().logout(request,response, SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/login";
	}

	@PostMapping("/checkCurrentPassword")
	public ResponseEntity<?> checkCurrentPassword(@RequestParam String currentPassword) {
		boolean isAvailable = userService.checkCurrentPassword(currentPassword); // 비밀번호 일치 여부 확인
		return ResponseEntity.ok().body(Map.of("available", isAvailable)); // 결과를 JSON 형태로 반환
	}
}