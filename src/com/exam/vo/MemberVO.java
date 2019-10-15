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
		return "MemberVO [id=" + id + ", passwd=" + passwd + ", name=" + name + ", regDate=" + regDate + ", age=" + age
				+ ", gender=" + gender + ", email=" + email + ", address=" + address + ", tel=" + tel + ", mtel=" + mtel
				+ ", birth=" + birth + ", interested=" + Arrays.toString(interested) + ", fUuid=" + fUuid + ", fPath="
				+ fPath + ", fName=" + fName + "]";
	}

}
