package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

// 자바빈 클래스 => 1) 멤버변수 2) 기본 생성자 3) getter/setter메소드
/*
Bean Validation이 제공하는 제약 어노테이션
	- NotNull : 빈값 체크
- NotBlank : null 체크, trim후 길이가 0인지 체크
- Size : 글자 수 체크
- Email : 이메일 주소 형식 체크
- Past : 오늘보다 과거 날짜(ex.생일)
- Future : 미래 날짜 체크(ex. 예약일)
*/
@Data
public class PmemberVO {
	@NotBlank
	private String id;
	@NotBlank
	private String password;
	@NotBlank
	private String name;
	private String gender;
	@Email
	private String mail;
	private String phone;
	private String address;
	private String registDay;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	//취미(jsp의 체크박스는 문자형 배열로 들어옴)
//	private List<> hobbyMap
	private String[] hobbyMap;
	
	// 카드(카드 번호, 유효 기간)
	private List<CardVO> cardVOList;
	
	// 국적
	private String nationality;
	
	// 주민 번호(hidden처리)
	private String regno;
	
	// 코인
	private int coin;
}
