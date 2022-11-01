<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<div class="card o-hidden border-0 shadow-lg my-5">
	<div class="card-body p-0">
		<!-- Nested Row within Card Body -->
		<div class="row">
			<div class="col-lg-7">
				<div class="p-5">
					<form class="user" name="frm" id="frm" method="post" 
						action="<%=request.getContextPath()%>/mail/sendMailProcess">
						<div class="form-group row">
							<div class="col-sm-6 mb-3 mb-sm-0">
								<input type="text" class="form-control form-control-user"
									id="from" name="from" placeholder="보내는 사람"
									value="smtp406@naver.com" readonly/>
								<input type="text" class="form-control form-control-user"
									id="to" name="to" placeholder="받는 사람" required />
							</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control form-control-user"
								id="subject" name="subject" placeholder="제목" required />
						</div>
						<div class="form-group">
							<textarea rows="7" cols="5" name="content1" id="content1"></textarea>
						</div>
						<button type="submit" class="btn btn-primary btn-user btn-block">메일 보내기</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	CKEDITOR.replace("content1");
</script>