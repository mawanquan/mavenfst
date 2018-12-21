package com.listener;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Branch;
import com.service.AdminServiceImp;
import com.untils.Read;
@WebListener
public class InitListener implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("--------------监听启动----------");
		ServletContext context = arg0.getServletContext();
		context.setAttribute("cxt", context.getContextPath());
		context.setAttribute("css", context.getContextPath()+"/css/");
		context.setAttribute("js", context.getContextPath()+"/js/");
		context.setAttribute("img", context.getContextPath()+"/images/");
		new Thread(){
			public void run() {
				 ApplicationContext app=new ClassPathXmlApplicationContext("applicationContext.xml");
				Read read=  (Read) app.getBean("read");
				read.read();
			};
			
		}.start();

	}

}
