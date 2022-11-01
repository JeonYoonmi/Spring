package kr.or.ddit.vo;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

// 회원 권한 자바빈 클래스
@Data
public class MemAuthVO {
	@NotNull
	private int userNo;
	@NotBlank
	private String auth;
}
