package soon.io.soon.security;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import lombok.AllArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import soon.io.soon.Services.user.UserService;
import soon.io.soon.models.roles.RoleContext;
import soon.io.soon.models.roles.Roles;
import soon.io.soon.models.user.User;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Component
@AllArgsConstructor
public class JwtProvider {

    // todo change the Secret from this place
    private final String SECRET_KEY = "secret";
    private final UserService userService;

    public String generateToken(UserDetailsImp userDetails) {
        String roles = userDetails.getAuthorities().stream()
                .map(GrantedAuthority::getAuthority)
                .collect(Collectors.joining(","));
        return Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, SECRET_KEY)
                .setSubject(userDetails.getUsername())
                .claim("roles", roles)
                .setIssuedAt(new Date(System.currentTimeMillis()))
                .setExpiration(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 10))
                .compact();
    }

    public String getUsername(String token) {
        Jws<Claims> parsedToken = Jwts.parser()
                .setSigningKey(SECRET_KEY)
                .parseClaimsJws(token.replace("Bearer ", ""));
        return parsedToken
                .getBody()
                .getSubject();
    }

    public UserDetails loadUserByUsername(String username) {
        User user = userService.findUserByEmail(username)
                .orElseThrow(() -> new UsernameNotFoundException("error.user.not-found"));
        List<SimpleGrantedAuthority> roles = user.getRoles()
                .stream()
                .map(Roles::getRoleContext)
                .map(RoleContext::name)
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
        return new org.springframework.security.core.userdetails.User(user.getEmail(),
                user.getPassword(), roles);
    }
}
