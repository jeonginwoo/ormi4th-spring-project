package com.estsoft.springproject.config;

import com.estsoft.springproject.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@EnableWebSecurity
@Configuration
public class WebSecurityConfig {

    @Bean
    public WebSecurityCustomizer configure() {
        return web -> web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
    }


   
    // 특정 HTTP 요청에 대한 웹 기반 보안 구성
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {

        httpSecurity.authorizeHttpRequests(auth ->
                                auth.requestMatchers("/login","/signup",
                                                "/adduser","/checkNicknameAvailability").permitAll()
                                        .requestMatchers("/mypage/admin").hasAnyAuthority("admin")
                                        .requestMatchers("/lineup/submit").hasAuthority("manager")
                                .anyRequest().authenticated())
                .formLogin(auth -> auth.loginPage("/login")     // 폼 기반 로그인 설정
                        .defaultSuccessUrl("/index",true))
                .logout(auth -> auth.logoutSuccessUrl("/login") // 로그아웃 설정
                        .invalidateHttpSession(true))
                .csrf(auth -> auth.disable());                  // csrf 비활성화
        return httpSecurity.build();
    }

	

	// 패스워드 인코더로 사용할 빈 등록
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
