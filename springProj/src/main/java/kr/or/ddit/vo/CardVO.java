package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

// 자바 빈 클래스
// PoJo(Plain oriented Java object)
@Data
public class CardVO {
	// 카드 번호
	private String no;
	// 유효 기간
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date validMonth;
}
