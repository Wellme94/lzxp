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
 * �ַ�UTF-8������
 */
@WebFilter("/*")
public class EncordingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
			throws IOException, ServletException {
		//�����������
		req.setCharacterEncoding("utf-8");
		//������Ӧ����
		res.setCharacterEncoding("utf-8");
		//����ִ����ȥ
		chain.doFilter(req, res);

	}

}
