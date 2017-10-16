package com.etc.lzxp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Administrator
 * 字符UTF-8过滤器
 */
@WebFilter("/*")
public class EncordingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//设置请求编码
		req.setCharacterEncoding("utf-8");
		//设置响应编码
		res.setCharacterEncoding("utf-8");
		//继续执行下去
		chain.doFilter(req, res);

	}

}
