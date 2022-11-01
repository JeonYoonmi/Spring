package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// 자바빈 클래스
// PoJo(plain oriented Java Object) 역행
// (어노테이션)setter, (어노테이션)getter로 따로 부를 수 있음
@Data
public class MemberVO {
	private String userId;
	private String password;
	private String gender;
	private String nationality;
	private String[] carArray;
	// 여부를 나타내는 체크박스의 경우 String, boolean으로 받을 수 있음
	private String developer;
	private boolean foreigner;
	private AddressVO address;
	private List<CardVO> cardList;
	// MEMBER 테이블의 INTRODUCTION 자료형이 CLOB이더라도 String 
	private String introduction;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date dateOfBirth;
	private MultipartFile picture;
	private MultipartFile picture2;
	private List<MultipartFile> pictureList;
	private List<MultipartFile> pictureMulti;
}
