<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<title>회원 가입</title>
<style type="text/css">
.imgs_wrap{
	width: 300px;
	margin-top: 50px;	
}

.imgs_wrap img{
	max-width: 100%;
	border-radius: 50%;	
	border: 3px solid black;
}
</style>
<script type="text/javascript">
	$(function(){
		// 이미지 미리보기 시작
		let sel_file = [];
		// input type="file" id="input_imgs"... 바뀌는 이벤트
		$('#input_imgs').on('change', handleImgFileSelect);
		
		// 파라미터 e : onchange 이벤트 객체
		function handleImgFileSelect(e){
			// 이벤트가 발생된 타겟 안에 들어이있는 파일들을 가져와보자
			let files = e.target.files;
			
			// 이미지가 여러개 있을 수 있으므로 이미지들을 분리해서 배열로 만듦
			let fileArr = Array.prototype.slice.call(files);
			
			// 파일 타입의 배열 반복. f : 배열 안에 들어있는 각각의 이미지 파일 객체
			fileArr.forEach(function(f){
				// 이미지 파일이 아닌경우 이미지 미리보기 실패처리
				if(!f.type.match("image.*")){
					alert("이미지 확장자만 가능합니다.");
					
					// 함수 종료
					return;
				}
				// 이미지 객체를 전역 배열 타입 변수에 넣자
				sel_file.push(f);
				
				// 이미지 객체를 읽을 자바 스크립트의 reader객체 생성
				let reader = new FileReader();
				
				// e : reader가 이미지 객체를 읽는 이벤트
				reader.onload = function(e){
					// e.target : 이미지 객체
					// e.target.result : reader가 이미지를 다 읽은 결과
					let img_html = "<img src=\"" + e.target.result + "\" />";
					
					// div 사이에 이미지가 렌더링 되어 화면에 보임
					// 객체 .append : 누적, .html : 새로고침, innerHTML : J/S
					$('.imgs_wrap').html(img_html);
				}
				
				// f: 이미지 파일 객체를 읽은 후 다음 이미지 파일(f)을 위해 초기화함
				reader.readAsDataURL(f);
			});
		}
		// 이미지 미리보기 끝
		
		// id가 btnDupChk인 버튼을 클릭하면 이벤트를 처리해보자
		$('#btnDupChk').on('click', function(){
			// ajax 비동기 통신을 통해 id가 userId인 요소의 값이
			let userId = $('#userId').val();
			
			// json 데이터
			let data = { "userId" : userId }
			
			// 데이터베이스에 있는 mem 테이블에 있는지를 체킹
			// data : "userId=" + userId,
			$.ajax({
				url : "/mem/dupChk",
				contentType : "application/json;charset=utf-8", 
				data : JSON.stringify(data),
				type : "post",
				success : function(result){
					console.log("result : " + JSON.stringify(result));
					// 중복시 alert("이미 id가 등록되어 있습니다.")
					
					// json 응답데이터 처리
					// .eacj : jquery의 반복문
					// 첫번 째 인자로 index를 주고, 두번째 인자로 item(콜백 함수)를 줌
					// index를 기준으로 반복을 함
					$.each(result, function(index, item){
						// item : {"result", "1"}
						let rslt = item;
						if(rslt != 0){
							alert("이미 ID가 등록되어 있습니다.");
							$('#userId').select();
						}else{
							alert("사용 가능한 아이디 입니다.");
						}
					})
				}
			})
		});
		
		// 비밀번호 확인 체크
		// 아이디가 userPwComfirm인 요소의 focus가 out이 되었을 때
		// 아이디가 userPw인 요소의 값과 비교하여
		// 다르면 alert("비밀번호 확인을 다시 해주세요. 비밀번호가 다릅니다.")
		$('#userPwComfirm').on('focusout', function(){
			let userPwComfirm = $('#userPwComfirm').val().trim();
			let userPw = $('#userPw').val().trim();
			
			// 비밀번호 확인이 다르다면
			if(userPwComfirm != userPw){
				alert("비밀번호를 다시 확인해주세요. 비밀번호가 다릅니다.");
			}
		});
		
		cnt = 1;
		// javascript에서 JSTL값을 받기***
		let userNoStr = "<c:out value='${ userNo }' />";
		console.log("userNoStr : " + userNoStr);
		
		// javascript sessionStorage
		sessionStorage.setItem("no", userNoStr);
		
		let noStr = sessionStorage.getItem("no");
		console.log("noStr : " + noStr);
		
		// + 버튼을 클릭시 다음을 추가해줌
		$('button[name="add"]').on('click', function(){
			if(cnt == 3){
				alert("더이상 추가할 수 없습니다.");
				return false;
			}
			
			let code = '<input type="hidden" name="memAuthVOList[' + cnt + '].userNo" value="${ userNo }">';
			code += '<select name="memAuthVOList['+ cnt +'].auth" class="form-control">';
			code += '<option value="manager">관리자</option>';
			code += '<option value="employee">직원</option>';
			code += '<option value="employer">고용주</option>';
			code += '</select>';
			
			$('#divAuth').append(code);
			
			cnt++;
		});
		
		// id가 divAuth인 요소의 last 자식 요소로 넣어줌
		// -버튼 클릭시 id가 divAuth인 요소의 last자식 요소를 제거함
		// 카운터가 0인 요소는 -를 계속 클릭 하더라도 사라지지 않도록 처리
		$('button[name="minus"]').on('click', function(){
			if(cnt == 1){
				alert("더이상 삭제할 수 없습니다.");
				return false;
			}
			$('#divAuth').children().last().remove();
			$('#divAuth').children().last().remove();
			cnt--;
		});
		
	});
</script>
</head>
<body>
	<div class="jumbotron">
		<!-- container : 이 안에 내용 있다. -->
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	
	<!-- 회원가입 시작 -->
	<div class="container">
		<form:form modelAttribute="memVO" action="memRegistPost" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<div class="imgs_wrap"></div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">회원 사진</label>
				<div class="col-sm-5">
					<input type="file" id="input_imgs" name="memImage" multiple />
				</div>
			</div>
		
			<div class="form-group row">
				<label class="col-sm-2">회원 번호</label>
				<div class="col-sm-3">
					<form:input path="userNo" class="form-control" placeholder="회원 번호" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">회원 ID</label>
				<div class="col-sm-3">
					<form:input path="userId" class="form-control"  placeholder="회원 ID" />
				</div>
				<button id="btnDupChk" type="button" class="btn btn-sm btn-primary">중복체크</button>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<form:password path="userPw" class="form-control"  placeholder="비밀번호" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" id="userPwComfirm" name="userPwComfirm" class="form-control"  placeholder="비밀번호 확인" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">회원 명</label>
				<div class="col-sm-3">
					<form:input path="userName" class="form-control"  placeholder="회원 명" />
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">권한</label>
				<div class="col-sm-3" id="divAuth">
					<!-- 선택 박스, +버튼 -버튼 -->
					<!-- 관리자(manager), 직원(employee), 고용주(employer) -->
					<button type="button" name="add" class="btn btn-primary"> + </button>
					<button type="button" name="minus" class="btn btn-primary"> - </button>
					<input type="hidden" name="memAuthVOList[0].userNo" value="${ userNo }">
					<form:select path="memAuthVOList[0].auth" class="form-control">
						<form:option value="manager">관리자</form:option>
						<form:option value="employee">직원</form:option>
						<form:option value="employer">고용주</form:option>
					</form:select>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10" style="margin-left: 20%">
					<button type="submit" class="btn btn-primary">등록</button>
					<button type="reset" class="btn btn-secondary">취소</button>
				</div>
			</div>
		</form:form>
	</div>
	<!-- 회원가입 끝 -->
</body>
</html>