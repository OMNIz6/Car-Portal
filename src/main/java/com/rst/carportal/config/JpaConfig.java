package com.rst.carportal.config;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(basePackages = {"com.rst.carportal"})
@PropertySource({"classpath:application.properties"})
@EnableTransactionManagement
public class JpaConfig {
	
	@Autowired
	private Environment env;
	
	@Bean
	DataSource source() {
		DriverManagerDataSource conn = new DriverManagerDataSource();
		
		conn.setUrl(env.getProperty("jdbc.url"));
		conn.setUsername(env.getProperty("jdbc.user"));
		conn.setPassword(env.getProperty("jdbc.password"));
		conn.setDriverClassName(env.getProperty("jdbc.driverClassName"));
		
		return conn;
	}
	
	final Properties jpaProperties() {
        final Properties hibernateProperties = new Properties();

        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
        hibernateProperties.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
        hibernateProperties.setProperty("hibernate.cache.use_second_level_cache", env.getProperty("hibernate.cache.use_second_level_cache"));
        hibernateProperties.setProperty("hibernate.cache.use_query_cache", env.getProperty("hibernate.cache.use_query_cache"));
        hibernateProperties.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));

        return hibernateProperties;
    }
	
    @Bean
    public LocalContainerEntityManagerFactoryBean entityManagerFactory() {

    	LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
    	final HibernateJpaVendorAdapter vendor = new HibernateJpaVendorAdapter();
    	
        factoryBean.setDataSource(source());
        factoryBean.setPackagesToScan("com.rst.carportal");
        factoryBean.setJpaVendorAdapter(vendor);
        factoryBean.setJpaProperties(jpaProperties());

        return factoryBean;
    }

    @Bean
    public PlatformTransactionManager transactionManager(final EntityManagerFactory emf) {
        final JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(emf);
        return transactionManager;
    }
    
}