package com.filter;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		HttpSession session=request.getSession();
		HashMap< String, Object> map=new HashMap<String, Object>();
		if(session.getAttribute("user")==null){
			StringBuffer path=request.getRequestURL();
			String suf=request.getQueryString();
			String url="";
			if(suf==null||"".equals(suf)){
				url=path.toString();
			}
			url=path.toString()+"?"+suf;
			map.put("path", url);
			session.setAttribute("map", map);
			response.sendRedirect(request.getContextPath() + "/admin/gologinview");
			return ;
			
			
		}else{
			arg2.doFilter(request, response); 
			
			
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
