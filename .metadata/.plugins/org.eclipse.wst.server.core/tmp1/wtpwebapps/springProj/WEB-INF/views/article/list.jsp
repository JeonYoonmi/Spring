<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="card shadow mb-4">
	<div class="card-body">
		<div class="table-responsive">
			<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<form name="frm" id="frm" action="/article/list" method="get">
					<div class="row">
					<!-- /article/list?show=10&cond=title&keyword=개똥이 -->
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="dataTable_length">
								<label>Show 
									<select name="show"
										aria-controls="dataTable" id="show"
										class="custom-select custom-select-sm form-control form-control-sm">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
									</select> entries
								</label>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<label>Search
									<select name="cond" aria-controls="dataTable" id="cond"
										class="custom-select custom-select-sm form-control form-control-sm">
										  <option value="" selected>전체</option>
										  <option value="title">글 제목</option>
										  <option value="writerName">작성자</option>
										  <option value="artContent">글 내용</option>
									</select>
								</label>
								<label>
									<input type="search" name="keyword"
										class="form-control form-control-sm" placeholder="검색어를 입력하세요"
										aria-controls="dataTable">
								</label>
								<label>
									<button type="submit" class="btn btn-primary btn-icon-split btn-sm">
	                                        <span class="icon text-white-50">
	                                            <i class="fas fa-flag"></i>
	                                        </span>
	                                        <span class="text">검색</span>
	                                </button>
								</label>
							</div>
						</div>
					</div>
				</form>
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
										style="width: 10%;">글 번호</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Position: activate to sort column ascending"
										style="width: 40%;">글 제목</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Office: activate to sort column ascending"
										style="width: 20%;">작성자</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Age: activate to sort column ascending"
										style="width: 15%;">작성일</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1"
										aria-label="Start date: activate to sort column ascending"
										style="width: 15%;">조회수</th>
<!-- 									<th class="sorting" tabindex="0" aria-controls="dataTable" -->
<!-- 										rowspan="1" colspan="1" -->
<!-- 										aria-label="Salary: activate to sort column ascending" -->
<!-- 										style="width: 67px;">Salary</th> -->
								</tr>
							</thead>
<!-- 							<tfoot> -->
<!-- 								<tr> -->
<!-- 									<th rowspan="1" colspan="1">Name</th> -->
<!-- 									<th rowspan="1" colspan="1">Position</th> -->
<!-- 									<th rowspan="1" colspan="1">Office</th> -->
<!-- 									<th rowspan="1" colspan="1">Age</th> -->
<!-- 									<th rowspan="1" colspan="1">Start date</th> -->
<!-- 									<th rowspan="1" colspan="1">Salary</th> -->
<!-- 								</tr> -->
<!-- 							</tfoot> -->
							<tbody>
							<!-- model.addAttribute("data", list); -->
							<!-- data : List<ArticleVO> list -->
							<!-- row : ArticleVO articleVO -->
								<c:forEach var="row" items="${data}" varStatus="stat">
									<c:if test="${stat.count % 2 == 1}">
										<tr class="odd">
									</c:if>
									<c:if test="${stat.count % 2 == 0}">
										<tr class="even">
									</c:if>
										<td class="sorting_1">${stat.count}</td>
										<td>${row.title}</td>
										<td>${row.writerName}</td>
										<td>${row.regdate}</td>
										<td>${row.readCnt}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-12 col-md-5">
						<div class="dataTables_info" id="dataTable_info" role="status"
							aria-live="polite">Showing 1 to 10 of 57 entries</div>
					</div>
					<div class="col-sm-12 col-md-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="dataTable_paginate">
							<ul class="pagination">
								<li class="paginate_button page-item previous disabled"
									id="dataTable_previous"><a href="#"
									aria-controls="dataTable" data-dt-idx="0" tabindex="0"
									class="page-link">Previous</a></li>
								<li class="paginate_button page-item active"><a href="#"
									aria-controls="dataTable" data-dt-idx="1" tabindex="0"
									class="page-link">1</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="2" tabindex="0"
									class="page-link">2</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="3" tabindex="0"
									class="page-link">3</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="4" tabindex="0"
									class="page-link">4</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="5" tabindex="0"
									class="page-link">5</a></li>
								<li class="paginate_button page-item "><a href="#"
									aria-controls="dataTable" data-dt-idx="6" tabindex="0"
									class="page-link">6</a></li>
								<li class="paginate_button page-item next" id="dataTable_next"><a
									href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0"
									class="page-link">Next</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>