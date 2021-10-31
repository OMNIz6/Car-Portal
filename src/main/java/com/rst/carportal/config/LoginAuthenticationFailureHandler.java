package com.rst.carportal.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

public class LoginAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler { 

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {    

       if(exception.getClass().isAssignableFrom(BadCredentialsException.class)) {
    	   System.out.println("......................................");
              setDefaultFailureUrl("/login_error1");
        }

       else if (exception.getClass().isAssignableFrom(LockedException.class)) {
    	   System.out.println("......................................");
            setDefaultFailureUrl("/login_error2");
       }

      super.onAuthenticationFailure(request, response, exception);
    }    
}