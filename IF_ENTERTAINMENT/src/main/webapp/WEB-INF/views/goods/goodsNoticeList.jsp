<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<div class="central-meta">
	<form id="pageForm">
	    <input type="hidden" name="page" id="page"/>
	    <sec:csrfInput/>
	</form>
	
	<span class="create-post user_goodsnotice">공지사항
		<!-- <a title="" href="#">Full Month</a> -->
	</span>
	<table class="table monthly-forecast">
		<thead>
			<tr>
				<th>번호</th>
				<th>제 목</th>
				<th>등록일</th>
				<!--<th>Description</th>
 				<th>Temp</th>
				<th>Humidity</th>
				<th>Percip</th> -->
			</tr>
		</thead>
		<tbody>
			<c:set value="${pagingVO.dataList }" var="goodsNoticeList" />
			<c:choose>
				<c:when test="">
					<tr>
	        			<td colspan="3">공지사하 리스트가 존재하지 않습니다.</td>
	        		</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${goodsNoticeList }" var="goodsNotice">
						<tr class="goodsNoticeList">
							<td><span>${goodsNotice.bfNo }</span></td>
							<td style="text-align: left;"><a href="/goods/notice/userdetail.do?bfNo=${goodsNotice.bfNo}"><span>${goodsNotice.bfTitle }</span></a></td>
							<fmt:parseDate value="${goodsNotice.bfRegdate }" var="bfRegdate" pattern="yyyy-MM-dd" />
							<td><span><fmt:formatDate value="${bfRegdate}" pattern="yyyy-MM-dd" /></span></td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	<div class="card-footer prod-footer clearfix" id="pagingArea">
		${pagingVO.pagingHTML }
	</div>
</div>


<script type="text/javascript">
	$(function () {
		
		var pagingArea = $("#pagingArea");
		var pageForm = $("#pageForm");
		pagingArea.on("click", "a", function (event) {
			event.preventDefault();
			var pageNo = $(this).data("page");
			pageForm.find("#page").val(pageNo);
			pageForm.submit();
		});
	})
</script>