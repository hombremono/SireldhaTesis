package ar.com.iua.web.spring;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

import ar.com.iua.web.spring.security.SecurityConfig;

@Configuration
@ComponentScan(basePackages = { "ar.com.iua.web.spring" })
@Import({ WebConfig.class, PersistenceConfig.class, Beans.class, SecurityConfig.class })
public class RootConfig {

}
