package soon.io.soon.security;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static soon.io.soon.security.SecurityUtils.*;

public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter implements WebMvcConfigurer {

    private final JwtProvider jwtProvider;
    private final AuthenticationManager authenticationManager;

    public JwtAuthenticationFilter(AuthenticationManager authenticationManager, JwtProvider jwtProvider) {
        this.jwtProvider = jwtProvider;
        this.authenticationManager = authenticationManager;
        setFilterProcessesUrl(AUTH_URL);
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        return authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getParameter("username"), request.getParameter("password")));
    }

    @Override
    protected void successfulAuthentication(HttpServletRequest request, HttpServletResponse response, FilterChain chain, Authentication authResult) throws IOException, ServletException {
        User credentials = ((User) authResult.getPrincipal());
        UserDetailsImp userDetails = new UserDetailsImp();
        userDetails.setUsername(credentials.getUsername());
        String token = jwtProvider.generateToken(userDetails);
        response.setStatus(HttpStatus.OK.value());
        response.addHeader("Access-Control-Expose-Headers", "Authorization");
        response.addHeader(TOKEN_HEADER, TOKE_PREFIX + token);
        try {
            PrintWriter out = response.getWriter();
            out.print(TOKE_PREFIX + token);
            out.flush();
        } catch (IOException ex) {
            logger.error("can't print response token");
        }
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("swagger-ui.html")
                .addResourceLocations("classpath:/META-INF/resources/");

        registry.addResourceHandler("/webjars/**")
                .addResourceLocations("classpath:/META-INF/resources/webjars/");
    }
}
