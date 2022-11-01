package kr.or.ddit.dto;

import java.io.Serializable;

//자바빈 클래스(DTO, VO)
//Serializable(직렬화 : 멤버변수를 쭉 나열하여 처리)
public class Person implements Serializable {
	//멤버변수 = 필드
	private int id = 20181004;
	private String name = "홍길순";
	
	//기본생성자
	public Person() { }

	//getter/setter메소드
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
