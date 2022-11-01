package kr.or.ddit.vo;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import lombok.Data;

// ?articleNo=12&writerId=a001&writerName=개똥이 => 바인딩
// articleVO.setArticleNo(12), articleVO.setWriterId("a001")
// 자바 빈 클래스
// PoJo(Plain oriented Java Object)
/*
	Bean Validation이 제공하는 제약 어노테이션
		- NotNull : 빈값 체크
	- NotBlank : null 체크, trim후 길이가 0인지 체크
	- Size : 글자 수 체크
	- Email : 이메일 주소 형식 체크
	- Past : 오늘보다 과거 날짜(ex.생일)
	- Futere : 미래 날짜 체크(ex. 예약일)
*/
@Data
public class ArticleVO {
	// 일련번호
	private int rnum;
	
	private int articleNo;
	private String writerId;
	
	// 작성자(필수 - mandatory)
	@NotBlank
	private String writerName;
	
	// 제목(필수)
	@NotBlank
	private String title;
	private String artContent;
	private Date regdate;
	private Date moddate;
	private int readCnt;
}
