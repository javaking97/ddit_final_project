<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style type="text/css">

.title-block form input {
    background: #fff none repeat scroll 0 0;
    border: 1px solid #dedede;
    border-radius: 5px;
    font-size: 13px;
    padding: 10px 15px;
    width: 93%;
}

</style>

</head>
<body>
	<h3 style="margin-bottom:20px;">🤸‍♂️ 오디션 일정확인</h3>
	<div class="title-block search_box">
		<div class="row">
			<div class="col-lg-6">
				<div class="row merged20">
					<div class="col-lg-7 col-md-7 col-sm-7">
						<form method="post" id="searchForm">
							<input type="hidden" name="page" id="page"/>
							<input type="text" name="searchType" value="${searchType }" style="display: none;">
							<input type="text" name="searchWord" value="${searchWord }" placeholder="검색">
							<button type="submit" style=" top:0;">
                        <i class="fa-regular fa-magnifying-glass" style=" top:10%;"></i>
                     </button>
							<sec:csrfInput/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="central-meta">
		<div class="row">
			<table class="table table-responsive">
				<thead style="width: inherit;">
					<tr align="center">
						<th width="15%" style="padding-left: 25px;">순번</th>
						<th width="65%">오디션 모집요강</th>
						<th width="20%">등록일</th>
					</tr>
				</thead>
				<tbody class="ent-sched-tbody">
					<c:set value="${pagingVO.dataList }" var="auditionList"/>
					<c:choose>
						<c:when test="${empty auditionList }">
							<tr>
								<td colspan="3"> 조회하신 게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${auditionList}" var="audition">
							    <tr>
							        <td style="text-align: center; padding-left: 25px;">${audition.bfNo}</td>
							            
							        <td align="left" style="padding-left: 100px;">
							            <a href="/entertain/audition/scheduleDetail.do?bfNo=${audition.bfNo}" title="">
										    <c:if test="${audition.bfDelyn == 'Y'}">
										        <span class="badge badge-badge">마감</span>
										    </c:if>
										    <c:if test="${audition.bfDelyn != 'Y'}">
										        <span class="badge badge-danger">진행</span>
										    </c:if>
										    ${audition.bfTitle}
										</a>			
							        </td>
							        <td align="center">
							            <fmt:formatDate value="${audition.bfRegdate}" pattern="yyyy-MM-dd"/>
							        </td>
							    </tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
	</div>
<div class="card-footer prod-footer clearfix" id="pagingArea" style="display: flex; justify-content: center;" >
		${pagingVO.pagingHTML }
	</div>

<script type="text/javascript">
$(function(){
	var searchForm = $("#searchForm");
	var pagingArea = $("#pagingArea");
	var searchIcon = $("#searchIcon");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		var pageNo = $(this).data("page");
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});
});
</script>
</body>
</html>