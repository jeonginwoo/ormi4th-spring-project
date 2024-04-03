package com.estsoft.springproject.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

@Aspect
@Component
public class AuthenticationAspect {

    @Before("execution(* com.estsoft.springproject.controller.*.*(..))")
    public void addUserNameToModel(JoinPoint joinPoint) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null && auth.getPrincipal() instanceof UserDetails) {
            UserDetails userDetails = (UserDetails) auth.getPrincipal();
            for (Object arg : joinPoint.getArgs()) {
                if (arg instanceof Model) {
                    Model model = (Model) arg;
                    model.addAttribute("userName", userDetails.getUsername());
                    break;
                }
            }
        }
    }
}
