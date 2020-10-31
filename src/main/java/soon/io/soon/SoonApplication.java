package soon.io.soon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import soon.io.soon.Utils.SwaggerConfiguration;


@SpringBootApplication
@Import(SwaggerConfiguration.class)
public class SoonApplication {
    public static void main(String[] args) {
        SpringApplication.run(SoonApplication.class, args);
    }
}
