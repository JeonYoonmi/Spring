package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

// 회원 정보 자바빈 클래스
@Data
public class MemVO {
	@NotNull
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private int coin;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date regDate;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date updDate;
	private String enabled;
	
	// 첨부파일 명
	private String filename;
	
	// 중첩된 자바빈 클래스의 유효성 검사
	@Valid
	private List<MemAuthVO> memAuthVOList;
	
	// 첨부파일 - 이미지 객체
	private MultipartFile[] memImage;
	
	// 첨부파일 리스트
	private List<AttachVO> attachVOList;
	
	// 행번호
	private int rnum;
	
	// 페이지 번호
	private int pnum;
	
}
