<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<form name="frm" id="frm" action="/mem/memList" method="get">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_length" id="dataTable_length">
							<label>Show <select name="show" id="show"
								aria-controls="dataTable"
								class="custom-select custom-select-sm form-control form-control-sm">
									<option value="10">10</option>
									<option value="25" <c:if test="${ param.show == 25 }">selected</c:if>>25</option>
									<option value="50" <c:if test="${ param.show == 50 }">selected</c:if>>50</option>
									<option value="100" <c:if test="${ param.show == 100 }">selected</c:if>>100</option></select> entries
							</label>
						</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div id="dataTable_filter" class="dataTables_filter">
							<label>검색 
								<select name="cond" aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
								  <option value="">전체</option>
								  <option value="userNo" <c:if test="${ param.cond == 'userNo' }">selected</c:if>>회원번호</option>
								  <option value="userId" <c:if test="${ param.cond == 'userId' }">selected</c:if>>회원아이디</option>
							  	  <option value="userName" <c:if test="${ param.cond == 'userName' }">selected</c:if>>회원명</option>
								</select>
							</label>
							<!--
								{ param.keyword } = { map.keyword )
								URI : http://localhost/article/list?show=10&cond=&keyword=3
								param : {show=10, cond=, keyword=3}
							 -->
							<label><input type="search" name="keyword"
								class="form-control form-control-sm" placeholder="검색어를 입력하세요."
								aria-controls="dataTable" value="${ param.keyword }"></label>
							<label>
								<button type="submit" class="btn btn-light btn-icon-split btn-sm">
	                              <span class="icon icon text-gray-50">
	                                  <i class="fas fa-search fa-sm"></i>
	                              </span>
	                              <span class="text">검색</span>
                            	</button>
                            </label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-bordered dataTable" id="dataTable"
							width="100%" cellspacing="0" role="grid"
							aria-describedby="dataTable_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="dataTable" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Name: activate to sort column descending"
										style="width: 10%;">번호</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending"
										style="width: 15%;">회원번호</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending"
										style="width: 15%;">회원아이디</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 15%;">회원명</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Start date: activate to sort column ascending"
										style="width: 15%;">입력일자</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Salary: activate to sort column ascending"
										style="width: 10%;">활성화 여부</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Salary: activate to sort column ascending"
										style="width: 20%;">권한</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="memVO" items="${ memVOList.content }" varStatus="stat">
<%-- 									<c:if test="${ stat.count % 2 == 0 }"> --%>
										<tr class="even">
<%-- 									</c:if> --%>
<%-- 									<c:if test="${ stat.count % 2 != 0 }"> --%>
<!-- 										<tr class="odd"> -->
<%-- 									</c:if> --%>
									<td class="sorting_1">${ memVO.rnum }</td>
									<td>${ memVO.userNo }</td>
									<td>${ memVO.userId }</td>
									<td>${ memVO.userName }</td>
									<td><fmt:formatDate value="${ memVO.regDate }" pattern="yyyy-MM-dd" /></td>
									<c:if test="${ memVO.enabled == 0 }">
										<td>탈퇴</td>
									</c:if>
									<c:if test="${ memVO.enabled == 1 }">
										<td>회원</td>
									</c:if>
									<td>
										<!-- memVO.memAuthVOList => List<MemAuthVO> -->
										<c:forEach var="memAuthVO" items="${ memVO.memAuthVOList }" varStatus="stat">
												<c:choose>
													<c:when test="${ memAuthVO.auth == 'manager' }">
														<a href="#"><img class="rounded-circle" src="/resources/sbadmin2/img/undraw_profile_2.svg" alt="..." width="30%"></a>
													</c:when>
													<c:when test="${ memAuthVO.auth == 'employer' }">
														<a href="#"><img class="rounded-circle" src="/resources/sbadmin2/img/undraw_profile_1.svg" alt="..." width="30%"></a>
													</c:when>
													<c:when test="${ memAuthVO.auth == 'employee' }">
														<a href="#"><img class="img-profile rounded-circle" src="/resources/sbadmin2/img/undraw_profile.svg" width="30%"></a>
													</c:when>
												</c:choose>
										</c:forEach>
									</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-4">
						<div class="dataTables_info" id="dataTable_info" role="status"
							aria-live="polite">
							<c:if test="${param.show==null}">
		                        <c:set var="show" value="1" />
		                    </c:if>
		                    <c:if test="${param.show!=null}">
		                       <c:set var="show" value="${param.show}" />
		                    </c:if>
							<c:set var="endRow" value="${ memVOList.currentPage * show }" />
							<c:set var="startRow" value="${ endRow - ( show - 1 ) }" />
							<c:if test="${ endRow gt memVOList.total }">
								<c:set var="endRow" value="${ memVOList.total }" />
							</c:if>
							Showing ${ startRow } to ${ endRow } of ${ memVOList.total } entries</div>
					</div>
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTable_paginate">
							<!-- class="... disabled" => 비활성 -->
							<ul class="pagination">
								<li class="paginate_button page-item previous <c:if test='${ memVOList.startPage lt 6 }'>disabled</c:if>"
									id="dataTable_previous"><a href="/mem/memList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ memVOList.startPage - 5 }"
									aria-controls="dataTable" data-dt-idx="0" tabindex="0"
									class="page-link">Previous</a></li>
								<!--  data : ArticlePage 객체 -->
								<c:forEach var="pNo" begin="${ memVOList.startPage }" end="${ memVOList.endPage }">
								<li class="paginate_button page-item <c:if test="${ memVOList.currentPage == pNo }">active</c:if>">
								<!-- 
									1 ) 검색 안함 : ?show=&cond=&currentPage=3
									2 ) 검색 함 : ?show=&cond=&currentPage=3
								 -->
									<a href="/mem/memList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ pNo }"
										aria-controls="dataTable" data-dt-idx="1" tabindex="0"
										class="page-link">${ pNo }</a></li>
								</c:forEach>
								<li class="paginate_button page-item next <c:if test="${ memVOList.endPage ge memVOList.totalPages }">disabled</c:if>" id="dataTable_next"><a
									href="/mem/memList?show=${ map.show }&cond=${ map.cond }&keyword=${ map.keyword }&currentPage=${ memVOList.startPage + 5 }" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
									class="page-link">Next</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
