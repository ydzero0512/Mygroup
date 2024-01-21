package com.mygroup.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.mygroup.persistence.MemberDAO;

import lombok.Setter;
import com.mygroup.domain.*;
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberDAO mdao;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		try {
			MemberVO member = mdao.readEmail(email);
			return member == null?null:new CustomMemberVO(member);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
