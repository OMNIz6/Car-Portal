package com.rst.carportal;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.rst.carportal.config.JpaConfig;
import com.rst.carportal.config.SecurityConfig;
import com.rst.carportal.config.WebMvcConfig;


public class Initializer extends AbstractAnnotationConfigDispatcherServletInitializer  {
	
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { JpaConfig.class, SecurityConfig.class};
    }

    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{WebMvcConfig.class};
    }

    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
