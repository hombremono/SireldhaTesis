package ar.com.iua.web.spring.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;

import ar.com.iua.web.spring.security.model.service.UserDetailService;
import ar.com.iua.web.spring.services.ConstantesURL;

@Configuration
@EnableWebSecurity // (debug = true)
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true, proxyTargetClass = true)
@PropertySource({ "classpath:/config/security.properties" })
public class SecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private Environment env;

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers(ConstantesURL.URL_BASE + "/**").authenticated()
			.antMatchers(ConstantesURL.URL_BASE + "/**").authenticated();
		if (Boolean.parseBoolean(env.getProperty("auth.basic", "true"))) {
			//----------------------------------------------------------------------------------------------------------
			//---------------------------------------------VIEW AUTH----------------------------------------------------
			http.httpBasic().and()
				.authorizeRequests()
				.antMatchers(HttpMethod.GET,"/app/views/familia/*").hasAnyRole("ADMIN","ENTRY")
				.antMatchers(HttpMethod.GET,"/app/views/searchFamily.html").hasAnyRole("ADMIN","ENTRY","PLAN");
			//----------------------------------------------------------------------------------------------------------
			//----------------------------------------------------------------------------------------------------------
		}
		if (Boolean.parseBoolean(env.getProperty("auth.form", "true"))) {
			FormLoginConfigurer<HttpSecurity> flc = http.formLogin();
			if (env.getProperty("auth.form.login.page", "").length() > 0) {
				flc.loginPage(env.getProperty("auth.form.login.page")).permitAll().loginProcessingUrl("/login");
			}
			flc.defaultSuccessUrl(env.getProperty("auth.form.login.success", "/")).permitAll().and().logout()
					.permitAll().logoutSuccessUrl(env.getProperty("logout.success.url", "/login?logout")).and()
					.rememberMe().tokenValiditySeconds(60 * 60 * 24).key("web3pass").rememberMeCookieName("rmweb3");
		}

		if (Boolean.parseBoolean(env.getProperty("ensure.https", "false")))
			http.requiresChannel().antMatchers("/**").requiresSecure();
		http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and().csrf().disable();

	}

	@Autowired
	private UserDetailService userDetailsService;

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		if (Boolean.parseBoolean(env.getProperty("in.memory.users", "true"))) {
			auth.inMemoryAuthentication().withUser("user").password("password").roles("USER").and().withUser("admin")
					.password("password").roles("USER", "ADMIN");
		} else {
			auth.userDetailsService(userDetailsService);
		}

	}

}
