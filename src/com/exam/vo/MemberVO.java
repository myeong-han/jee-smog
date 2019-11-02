package com.exam.vo;

import java.sql.Timestamp;
import java.util.Arrays;

public class MemberVO {
	
	private String id;
	private String passwd;
	private String name;
	private Timestamp regDate;
	private int age;
	private String gender;
	private String email;
	private String address;
	private String tel;
	private String mtel;
	private Timestamp birth;
	private String[] interested;
	private String fUuid;
	private String fPath;
	private String fName;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getMtel() {
		return mtel;
	}
	public void setMtel(String mtel) {
		this.mtel = mtel;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	
	public String[] getInterested() {
		return interested;
	}
	public void setInterested(String[] interested) {
		this.interested = interested;
	}
	public String getfUuid() {
		return fUuid;
	}
	public void setfUuid(String fUuid) {
		this.fUuid = fUuid;
	}
	public String getfPath() {
		return fPath;
	}
	public void setfPath(String fPath) {
		this.fPath = fPath;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MemberVO [id=");
		builder.append(id);
		builder.append(", passwd=");
		builder.append(passwd);
		builder.append(", name=");
		builder.append(name);
		builder.append(", regDate=");
		builder.append(regDate);
		builder.append(", age=");
		builder.append(age);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", email=");
		builder.append(email);
		builder.append(", address=");
		builder.append(address);
		builder.append(", tel=");
		builder.append(tel);
		builder.append(", mtel=");
		builder.append(mtel);
		builder.append(", birth=");
		builder.append(birth);
		builder.append(", interested=");
		builder.append(Arrays.toString(interested));
		builder.append(", fUuid=");
		builder.append(fUuid);
		builder.append(", fPath=");
		builder.append(fPath);
		builder.append(", fName=");
		builder.append(fName);
		builder.append("]");
		return builder.toString();
	}
}
