package com.yamakja.shop.security;

import com.yamakja.shop.service.CustomOAuth2UserService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.CustomUserTypesOAuth2UserService;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig {

    private final CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public BCryptPasswordEncoder encoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http
                .csrf().disable()
                .httpBasic().disable()
//                .anonymous().disable()
                .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/auth")
                .usernameParameter("id")
                .passwordParameter("password")
                .defaultSuccessUrl("/home")
                .and()
                .authorizeRequests()
                .antMatchers("/api/user","/login", "/signup","/itemList").permitAll()
//                .anyRequest().authenticated()
                .and()
                .oauth2Login().loginPage("/login")
                .defaultSuccessUrl("/", true)
                .userInfoEndpoint()
                .userService(customOAuth2UserService);
        return http.build();
    }
}
