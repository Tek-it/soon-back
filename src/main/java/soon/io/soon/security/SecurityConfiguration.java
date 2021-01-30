package soon.io.soon.security;


import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import static soon.io.soon.security.SecurityUtils.FORGOT_PASSWORD_URL;
import static soon.io.soon.security.SecurityUtils.REGISTER_URL;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
@RequiredArgsConstructor
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {

    private final UserDetailService userDetailService;
    private final JwtProvider jwtProvider;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors()
                .and()
                .csrf()
                .disable()
                .authorizeRequests()
                .antMatchers(REGISTER_URL)
                .permitAll()
                .anyRequest()
                .authenticated()
                .and()
                .addFilter(new JwtAuthenticationFilter(authenticationManager(), jwtProvider))
                .addFilter(new JWTAuthorizationFilter(authenticationManager(), jwtProvider));
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Bean
    DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setUserDetailsService(this.userDetailService);
        return daoAuthenticationProvider;
    }

    ;

    @Bean
    PasswordEncoder passwordEncoder() {
        return NoOpPasswordEncoder.getInstance();
    }

    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        final UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        CorsConfiguration corsConfigs = new CorsConfiguration().applyPermitDefaultValues();
        corsConfigs.addAllowedOrigin(CorsConfiguration.ALL);
        corsConfigs.addAllowedMethod(HttpMethod.GET);
        corsConfigs.addAllowedMethod(HttpMethod.POST);
        corsConfigs.addAllowedMethod(HttpMethod.PUT);
        corsConfigs.addAllowedMethod(HttpMethod.PATCH);
        corsConfigs.addAllowedMethod(HttpMethod.DELETE);
        corsConfigs.addAllowedMethod(HttpMethod.OPTIONS);
        corsConfigs.setAllowCredentials(true);
        corsConfigs.setMaxAge(3600L);
        corsConfigs.addAllowedHeader("Content-Type");
        corsConfigs.addAllowedHeader("Range");
        corsConfigs.addExposedHeader("Authorization");
        corsConfigs.addExposedHeader("Link");
        corsConfigs.addExposedHeader("X-Total-Count");
        corsConfigs.addExposedHeader("X-Forwarded-For");
        source.registerCorsConfiguration("/**", corsConfigs);
        return source;
    }

}
