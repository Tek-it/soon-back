package soon.io.soon.security;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.web.servlet.HandlerExceptionResolver;
import soon.io.soon.Utils.Errorhandler.ApplicationException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static soon.io.soon.security.SecurityUtils.TOKEN_HEADER;

public class JWTAuthorizationFilter extends BasicAuthenticationFilter {

    public AuthenticationManager authenticationManager;
    private final JwtProvider jwtProvider;
    private final HandlerExceptionResolver handlerExceptionResolver;

    public JWTAuthorizationFilter(AuthenticationManager authenticationManager, JwtProvider jwtProvider, HandlerExceptionResolver handlerExceptionResolver) {
        super(authenticationManager);
        this.authenticationManager = authenticationManager;
        this.jwtProvider = jwtProvider;
        this.handlerExceptionResolver = handlerExceptionResolver;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws IOException, ServletException {
        UsernamePasswordAuthenticationToken authentication = getAuthentication(request, response);
        if (authentication == null) {
            SecurityContextHolder.getContext().setAuthentication(null);
            chain.doFilter(request, response);
            return;
        }
        SecurityContextHolder.getContext().setAuthentication(authentication);
        chain.doFilter(request, response);
    }

    private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String token = request.getHeader(TOKEN_HEADER);
        if (token != null) {
            try {
                String username = jwtProvider.getUsername(token);
                if (username != null) {
                    UserDetails userDetails = jwtProvider.loadUserByUsername(username);
                    return new UsernamePasswordAuthenticationToken(userDetails.getUsername(), null, userDetails.getAuthorities());
                }
            } catch (Exception e) {
                handlerExceptionResolver.resolveException(request, response, null, new ApplicationException("error.token.expired"));
            }
        }
        return null;
    }

}
