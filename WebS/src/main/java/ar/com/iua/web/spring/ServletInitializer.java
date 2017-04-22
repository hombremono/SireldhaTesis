package ar.com.iua.web.spring;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {
	private static Logger LOG = LoggerFactory.getLogger(ServletInitializer.class);

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		String val = System.getenv("APP_PROFILE");
		boolean valOk = false;
		if (val != null && val.trim().length() > 0) {
			valOk = true;
		} else {
			val = System.getProperty("app.profile");
			if (val != null && val.trim().length() > 0)
				valOk = true;
		}
		if (valOk)
			servletContext.setInitParameter("spring.profiles.active", val.toLowerCase());
		else
			val = "default";
		LOG.debug("Perfil habilitado: {}", val);
		
		super.onStartup(servletContext);
	}

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { RootConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/*" };
	}

	
	
	
	
}
