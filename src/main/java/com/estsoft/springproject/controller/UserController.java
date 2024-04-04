package com.estsoft.springproject.controller;

import java.util.List;
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
	public String myPage(Model model,@AuthenticationPrincipal UserDetails userDetails) {

		if (userDetails!=null) {
			Long userId = getUserIdFromUserDetails(userDetails);

			if (userId!=null) {
					Page<Board> boardPageResult = userService.getUserBoardsPaged(userId, 1);
					Page<Comment> commentPageResult = userService.getUserCommentsPaged(userId, 1);
					User user = userService.findById(userId);
					model.addAttribute("boardPage", boardPageResult);
					model.addAttribute("commentPage", commentPageResult);
					model.addAttribute("user", user);
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
	public String updateMypageInfo(@PathVariable Long userId,@ModelAttribute UserRequest userRequest,Model model){
		User user = userService.findById(userId);
		String encodedPassword = passwordEncoder.encode(userRequest.getPassword());
		userRequest.setPassword(encodedPassword);
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
			return "test/admin";
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

}
