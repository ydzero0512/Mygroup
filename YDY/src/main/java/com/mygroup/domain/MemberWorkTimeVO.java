package com.mygroup.domain;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberWorkTimeVO {

	private Integer id;
	private Integer memberId;
	private Integer week;
	private String todayWorkTime;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd",timezone = "Asia/Seoul")
	private Timestamp workDate;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss",timezone = "Asia/Seoul")
	private Timestamp workStartTime;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "HH:mm:ss",timezone = "Asia/Seoul")
	private Timestamp workEndTime;
	
	private String sumThisWeek;
	
	private String leftThisWeek;
	
	private String overThisWeek;

	private String sumThisMonth;
	

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

	public Integer getWeek() {
		return week;
	}

	public void setWeek(Integer week) {
		this.week = week;
	}

	public String getTodayWorkTime() {
		return todayWorkTime;
	}

	public void setTodayWorkTime(String todayWorkTime) {
		this.todayWorkTime = todayWorkTime;
	}

	public String getSumThisWeek() {
		return sumThisWeek;
	}

	public void setSumThisWeek(String sumThisWeek) {
		this.sumThisWeek = sumThisWeek;
	}

	public String getLeftThisWeek() {
		return leftThisWeek;
	}

	public void setLeftThisWeek(String leftThisWeek) {
		this.leftThisWeek = leftThisWeek;
	}

	public String getOverThisWeek() {
		return overThisWeek;
	}

	public void setOverThisWeek(String overThisWeek) {
		this.overThisWeek = overThisWeek;
	}

	public String getSumThisMonth() {
		return sumThisMonth;
	}

	public void setSumThisMonth(String sumThisMonth) {
		this.sumThisMonth = sumThisMonth;
	}

	
	
	

}
