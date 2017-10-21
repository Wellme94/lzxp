package com.etc.lzxp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
/**
 * 过滤器
 * @author Administrator
 *
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//设置请求编码
		request.setCharacterEncoding("utf-8");
		//设置响应编码
		response.setCharacterEncoding("utf-8");
		//执行chain方法，放行
		chain.doFilter(request,response);
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
