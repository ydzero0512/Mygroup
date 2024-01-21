package com.mygroup.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import com.mygroup.domain.*;

import lombok.Getter;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomMemberVO extends User {

	private MemberVO member;

	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}

	public CustomMemberVO(MemberVO member) {

		super(member.getEmail(), member.getPassword(),
				new ArrayList<GrantedAuthority>(Arrays.asList(new SimpleGrantedAuthority(member.getIsAdmin()))));

		this.member = member;

	}

}
