package soon.io.soon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SoonApplication {

    public static void main(String[] args) {
        SpringApplication application =
                new SpringApplication(SoonApplication.class);
        application.run(args);
    }
}
