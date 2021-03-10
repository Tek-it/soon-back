package soon.io.soon.security;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import soon.io.soon.Utils.Errorhandler.CustomException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static soon.io.soon.security.SecurityUtils.*;

public class JwtAuthenticationFilter extends UsernamePasswordAuthenticationFilter {

    private final JwtProvider jwtProvider;
    private final AuthenticationManager authenticationManager;
    private final HandlerExceptionResolver handlerExceptionResolver;

    public JwtAuthenticationFilter(AuthenticationManager authenticationManager, JwtProvider jwtProvider, HandlerExceptionResolver handlerExceptionResolver) {
        this.jwtProvider = jwtProvider;
        this.authenticationManager = authenticationManager;
        setFilterProcessesUrl(AUTH_URL);
        this.handlerExceptionResolver = handlerExceptionResolver;
    }

    @Override
    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        try {
            return authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getParameter("username"), request.getParameter("password")));
        } catch (Exception e) {
            System.out.println(e.getMessage());
            handlerExceptionResolver.resolveException(request, response, null, new CustomException("error.credentials.bad"));
        }
        return null;
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
            handlerExceptionResolver.resolveException(request, response, null, ex);
        }
    }
}
