package com.rst.carportal.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.rst.carportal.auth.AccountSecurity;



@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Bean
	public UserDetailsService userDetailsService() {
		return new AccountSecurity();
	}
	@Bean
	public LoginAuthenticationFailureHandler handler() {
		return new LoginAuthenticationFailureHandler();
	}
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
		provider.setUserDetailsService(userDetailsService());
		provider.setPasswordEncoder(new BCryptPasswordEncoder());
		return provider;
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// TODO Auto-generated method stub
		auth.authenticationProvider(authenticationProvider());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		 http
			 .formLogin()
		         .loginPage("/login")
		         .loginProcessingUrl("/login")
		         .failureHandler(handler())
		         .permitAll()
		         .defaultSuccessUrl("/", true)
		    .and()
		    .csrf()
		 	.and()
		 	.authorizeRequests()
		 		.antMatchers(HttpMethod.POST,"/register").permitAll()
		 		.antMatchers("/css/style.css",
		 						"/img/**",
		 						"/js/**",
		 						"/register", 
		 						"/login",
		 						"/about_us",
		 						"/contact_us",
		 						"/terms_and_condition",
		 						"/login_error1",
		 						"/login_error2"
		 						).permitAll()
		 		.antMatchers(HttpMethod.GET,"/users").hasAuthority("admin")
		 		.anyRequest().hasAnyAuthority("user","admin")
		 	.and()
		 		.logout()
		 			.logoutSuccessUrl("/login")
		 			.invalidateHttpSession(true)
		 			.deleteCookies("JSESSIONID");
		 		
	}
}
