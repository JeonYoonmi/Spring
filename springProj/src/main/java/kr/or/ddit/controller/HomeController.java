package kr.or.ddit.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.vo.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/board")
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 메소드 레벨 요청 경로 지정
	// value 속성에 요청 경로 설정
	// (어노테이션)RequestMapping(value = "/register")
	// 속성이 하나일 때는 속성 명을 생략할 수 있음
	// (어노테이션)RequestMapping("/register")
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void regesterForm() {
//		logger.info(msg);
		log.info("regesterForm");
		
		// 리턴티입이 void의 경우 요청경로가
		// forwarding경로가 됨
//		return "board/register";
	}
	
	// formHome에서 regist(POST) 버튼을 눌렀을 경우
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public void regesterFormPost() {
		log.info("regesterForm(Post)");
	}
	
	// /board/modify 요청에 대한 경로를 지정해보자
	// logger.info("modifyForm");
	@RequestMapping("/modify")
	public void modifyForm() {
		log.info("modifyForm");
	}
	
	// P. 63
	// 경로 패턴 매핑
	// /board/read/100 => 100번(기본키 - BOARD테이블의 BOARD_NO => boardNo) 글
	@RequestMapping("/read/{boardNo}")
	public String read(@PathVariable("boardNo") int boardNo) {
		// 100
		log.info("read boardNo : " + boardNo);
		
		// 경로가 동적으로 변하므로 뷰 이름 지정
		return "board/read";
	}
	
	@RequestMapping(value = "/formHome")
	public String formHome() {
		return "board/formHome";
	}
	
	// 1) /board/list 요청을 처리해보자. method는 get. list.jsp는 다음과 같음
	   //      가) get일 때 log.info("update->get");  후에 return "board/update";
	   //      나) post일 때 log.info("update->post"); 후에 return "board/update";
	   /* 2) 
	    <a href="/board/update">개똥이</a>
	    <form action="/board/update" method="post">
	       <input type="text" name="title" value="개똥이" />
	       <button type="submit">변경</button>
	    </form>
	    */
	   //3) update.jsp의 내용은 <h2>변경완료</h2>로 구성해보자
	@RequestMapping(value = "/list")
	public String list() {
		return "board/list";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateGet() {
		log.info("update->get");
		return "board/update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost() {
		log.info("update->post");
		return "board/update";
	}
	
	
	
	@RequestMapping(value = "/write")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insertGet() {
		return "board/insert";
	}
	
	// /board/insert (post)
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(@RequestParam String title) {
		return "board/insert";
	}
	
	// /board/get?register
	@RequestMapping(value = "/get", method = RequestMethod.GET, params = "register")
	public String registerParams() {
		log.info("registerParams");
		return "board/register";
	}
	
	// /board/post
	@RequestMapping(value = "/post", method = RequestMethod.POST, params = "register")
	public String registerParamsPost() {
		log.info("registerParamsPost");
		return "board/register";
	}
	
	// /board/ajaxHome
	@RequestMapping(value = "/ajaxHome", method = RequestMethod.GET)
	public String ajaxHome() {
		return "board/ajaxHome";
	}
	
	// /board/ajaxHomePost
	@RequestMapping(value = "/ajaxHomePost", method = RequestMethod.GET)
	public String ajaxHomePost() {
		return "board/ajaxHomePost";
	}
	
	// 요청 URI => /board/100 => 100은 boardNo(게시판 기본키) => 동적으로 바뀜
	// data : {"boardNo":"12","title":"12","content":"12","writer":"12"}
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.PUT)
	public ResponseEntity<String> modify(@PathVariable("boardNo") int boardNo, @RequestBody Map<String, String> map) {
		log.info("boardNo : " + boardNo);
		log.info("map : " + map);
		
		// 안쓰는 방법
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	// 요청 URI => /board/100 => 100은 boardNo(게시판 기본키) => 동적으로 바뀜
	// contentType : "application/xml;charset=utf-8"
	// data : {"boardNo":"12","title":"12","content":"12","writer":"12"}
	// consumes = "application/json" => default 생략시 기본
	@RequestMapping(value = "/{boardNo}", method = RequestMethod.POST, consumes = "application/xml")
	public ResponseEntity<String> modifyPost(@PathVariable("boardNo") int boardNo, @RequestBody Map<String, String> map) {
		log.info("boardNo : " + boardNo);
		log.info("map : " + map);
		
		// 안쓰는 방법
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		return entity;
	}
	
	// /////////////////////////// 컨트롤러 응답 시작 ///////////////////////////
	// 요청 URI : /board/goHome0301
	// JSON 데이터를 받을 땐... (어노테이션)requestBody
	// JSON 데이터를 보낼 땐... (어노테이션)responseBody
	// ★★★★★
	@ResponseBody
	@GetMapping("/goHome0301")
	public BookVO home0301() {
		log.info("homr0301 왔다.");
		
		BookVO bookVO = new BookVO();
		bookVO.setBookId(100);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(10000);
		bookVO.setTitle("닥터 개똥이");
		
		// 자바빈 객체가 JSON으로 보내짐
		return bookVO;
	}
	
	// collection List 타입 응답
	@ResponseBody
	@GetMapping("/goHome04")
	public List<BookVO> home04(){
		List<BookVO> list = new ArrayList<BookVO>();
		
		// 1)
		BookVO bookVO = new BookVO();
		bookVO.setBookId(100);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(10000);
		bookVO.setTitle("닥터 개똥이");
		
		list.add(bookVO);
		
		// 2)
		bookVO = new BookVO();
		bookVO.setBookId(101);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(12000);
		bookVO.setTitle("이상한 변호사 개똥개");
		
		list.add(bookVO);
		
		// 3)
		bookVO = new BookVO();
		bookVO.setBookId(102);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(15000);
		bookVO.setTitle("그것이 알고 싶을까?");
		
		list.add(bookVO);		
		
		return list;
	}
	
	// 5. 컬렉션 Map 타입을 JSON으로 응답
	@ResponseBody
	@RequestMapping("/goHome05")
	public Map<String, BookVO> home05(){
		log.info("home05에 왔다.");
		
		Map<String, BookVO> map = new HashMap<String, BookVO>();
		
		// 1)
		BookVO bookVO = new BookVO();
		bookVO.setBookId(100);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(10000);
		bookVO.setTitle("닥터 개똥이");
		
		map.put("key1", bookVO);
		
		// 2)
		bookVO = new BookVO();
		bookVO.setBookId(101);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(12000);
		bookVO.setTitle("이상한 변호사 개똥개");
		
		map.put("key2", bookVO);
		
		// 3)
		bookVO = new BookVO();
		bookVO.setBookId(102);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(15000);
		bookVO.setTitle("그것이 알고 싶을까?");
		
		map.put("key3", bookVO);			
		
		return map;
	}
	
	// Http 헤더 정보와 내용을 가공해보자
	@ResponseBody
	@GetMapping("/goHome06")
	public ResponseEntity<Void> home06(){
		log.info("home06에 왔다.");
		
		// 200 OK 상태코드 응답
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	// Http 헤더 정보와 내용을 가공해보자
	@ResponseBody
	@GetMapping("/goHome07")
	public ResponseEntity<String> home07(){
		log.info("home07에 왔다.");
		
		// 200 OK 상태코드 응답
		return new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	}
	
	// Http 헤더 정보와 내용을 가공해보자
	@ResponseBody
	@GetMapping("/goHome08")
	public ResponseEntity<BookVO> home08(){
		log.info("home08에 왔다.");
		
		BookVO bookVO = new BookVO();
		bookVO.setBookId(100);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(10000);
		bookVO.setTitle("닥터 개똥이");		
		
		// 200 OK 상태코드 응답
		return new ResponseEntity<BookVO>(bookVO, HttpStatus.OK);
	}
	
	// Http 헤더 정보와 내용을 가공해보자
	@ResponseBody
	@GetMapping("/goHome09")
	public ResponseEntity<List<BookVO>> home09(){
		log.info("home09에 왔다.");
		
		List<BookVO> list = new ArrayList<BookVO>();
		
		// 1)
		BookVO bookVO = new BookVO();
		bookVO.setBookId(100);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(10000);
		bookVO.setTitle("닥터 개똥이");
		
		list.add(bookVO);
		
		// 2)
		bookVO = new BookVO();
		bookVO.setBookId(101);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(12000);
		bookVO.setTitle("이상한 변호사 개똥개");
		
		list.add(bookVO);
		
		// 3)
		bookVO = new BookVO();
		bookVO.setBookId(102);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(15000);
		bookVO.setTitle("그것이 알고 싶을까?");
		
		list.add(bookVO);
		
		// 200 OK 상태코드 응답
		return new ResponseEntity<List<BookVO>>(list, HttpStatus.OK);
	}
	
	// Http 헤더 정보와 내용을 가공해보자
	@ResponseBody
	@GetMapping("/goHome10")
	public ResponseEntity<Map<String, BookVO>> home10(){
		log.info("home10에 왔다.");
		
		Map<String, BookVO> map = new HashMap<String, BookVO>();
		
		// 1)
		BookVO bookVO = new BookVO();
		bookVO.setBookId(100);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(10000);
		bookVO.setTitle("닥터 개똥이");
		
		map.put("key1", bookVO);
		
		// 2)
		bookVO = new BookVO();
		bookVO.setBookId(101);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(12000);
		bookVO.setTitle("이상한 변호사 개똥개");
		
		map.put("key2", bookVO);
		
		// 3)
		bookVO = new BookVO();
		bookVO.setBookId(102);
		bookVO.setCategory("소설");
		bookVO.setInsertDate(new Date());
		bookVO.setPrice(15000);
		bookVO.setTitle("그것이 알고 싶을까?");
		
		map.put("key3", bookVO);			
		
		// 200 OK 상태코드 응답
		return new ResponseEntity<Map<String, BookVO>>(map, HttpStatus.OK);
	}
	
	// 11. ResponseEntity<byte[]> 타입
	// 톰켓 서버에 있는 이미지를 응답 해보자.
	@ResponseBody
	@GetMapping("/home1101")
	public ResponseEntity<byte[]> home1101() throws IOException{
		log.info("home1101");
		
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			 in = new FileInputStream("C:\\upload\\chopa.jpg");
			
			headers.setContentType(MediaType.IMAGE_JPEG);
			
			entity = new ResponseEntity<byte[]>(
						IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			
		} catch (FileNotFoundException e) {
			log.info(e.getMessage());
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		
		return entity;
	}
	
	@ResponseBody
	@GetMapping("/goHome1102")
	public ResponseEntity<byte[]> home1102() throws Exception{
		log.info("home1102 옴");
		
		// 001110100011101011101110
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		String fileName = "upload.zip";
		
		try {
			in = new FileInputStream("C:\\upload\\" + fileName);
			
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.add("Content-Disposition", "attachment;filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			in.close();
		}
		
		return entity;
	}
	// /////////////////////////// 컨트롤러 응답 끝 ////////////////////////////
}