package com.mygroup.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberWorkTimeVO {

	private Integer id;
	private Integer memberId;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Timestamp workDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private Timestamp workStartTime;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss")
	private Timestamp workEndTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Timestamp getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Timestamp workDate) {
		this.workDate = workDate;
	}

	public Timestamp getWorkStartTime() {
		return workStartTime;
	}

	public void setWorkStartTime(Timestamp workStartTime) {
		this.workStartTime = workStartTime;
	}

	public Timestamp getWorkEndTime() {
		return workEndTime;
	}

	public void setWorkEndTime(Timestamp workEndTime) {
		this.workEndTime = workEndTime;
	}

}
