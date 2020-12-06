package soon.io.soon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.DispatcherServlet;
import soon.io.soon.Utils.SwaggerConfiguration;


@SpringBootApplication
@Import(SwaggerConfiguration.class)
public class SoonApplication {
    public static void main(String[] args) {
        ConfigurableApplicationContext run = SpringApplication.run(SoonApplication.class, args);
        DispatcherServlet dispatcherServlet = (DispatcherServlet) run.getBean("dispatcherServlet");
        dispatcherServlet.setThrowExceptionIfNoHandlerFound(false);
    }
}
