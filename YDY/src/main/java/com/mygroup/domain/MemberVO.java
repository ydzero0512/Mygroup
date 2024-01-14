package com.mygroup.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int id;
	private int memberId;
	private String grade;
	private String department;
	private String email;
	private String phone;
	private String name;
	private Timestamp birthDay;
	
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", memberId=" + memberId + ", grade=" + grade + ", department=" + department
				+ ", email=" + email + ", phone=" + phone + ", name=" + name + "]";
	}
	


}
