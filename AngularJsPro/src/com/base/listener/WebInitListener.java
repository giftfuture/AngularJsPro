package com.base.listener;
import javax.servlet.ServletRequest;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.support.JdbcDaoSupport;


public class WebInitListener extends JdbcDaoSupport implements ServletContextListener {
	
	private static final Logger log = LoggerFactory.getLogger(WebInitListener.class);
	
	/*@Autowired(required=false)
	private JdbcTemplate jdbcTemplate;
	
	@Autowired(required=false)
	private DruidDataSource dataSource;*/
//	public static HashMap<String, String> ConfigMap=new HashMap<String, String>();
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		
	}
	@Override
	public void contextInitialized(ServletContextEvent event) {
	   //ServletContext servlet=event.getServletContext();
	   //Constants.init();
	   //SystemVariable.init();
	}
	

	

	

}
