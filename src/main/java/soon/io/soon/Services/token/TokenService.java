package soon.io.soon.Services.token;

import lombok.AllArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import soon.io.soon.Utils.Errorhandler.TokenException;
import soon.io.soon.models.token.Token;
import soon.io.soon.models.token.TokenRepository;

import java.time.LocalDateTime;
import java.util.UUID;

@Service
@AllArgsConstructor
public class TokenService {
    private final TokenRepository tokenRepository;

    public Token create(String holder) {
        Token token = Token.builder()
                .valid(true)
                .holder(holder)
                .expiration(LocalDateTime.now().plusDays(1))
                .value(UUID.randomUUID().toString())
                .build();
        return tokenRepository.save(token);
    }

    public boolean isValid(Token token) {
        Token foundToken = tokenRepository.findById(token.getId())
                .orElseThrow(() -> new TokenException("error.token.notfound"));
        return foundToken.isValid();
    }

    public boolean isValid(String value) {
        Token foundToken = tokenRepository.findByValue(value)
                .orElseThrow(() -> new TokenException("error.token.notfound"));
        return foundToken.isValid();
    }

    public Token invalidate(Token token) {
        token.setValid(false);
        return tokenRepository.save(token);
    }

    public Token find(String token) {
        return tokenRepository.findByValue(token)
                .orElseThrow(() -> new TokenException("error.token.notfound"));
    }
}

