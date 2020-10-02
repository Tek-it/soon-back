package soon.io.soon.security;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

public class JWTAutorizationFilter extends BasicAuthenticationFilter {

    public AuthenticationManager authenticationManager;

    public JWTAutorizationFilter(AuthenticationManager authenticationManager) {
        super(authenticationManager);
        this.authenticationManager = authenticationManager;
    }


}
