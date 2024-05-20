<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.fin {
	margin-bottom: 20px;
}


</style>
</head>
<body>
<h2 style="margin-bottom: 30px; font-family: 'GmarketSansMedium';">💸 재무정보 관리</h2>
<form action="excelUp.do" method="post" id="uploadForm" enctype="multipart/form-data">
    <div id="excelTable"></div>
    <input type="file" name="upFile" id="upFile" accept=".xls, .xlsx" style="display: none;">
    <!-- Bootstrap 및 Font Awesome 아이콘을 이용한 다운로드 버튼 -->
    
    <div class="buttonz fin">
    
    <button type="button" id="downBtn" class="btn btn-primary">
        <i class="fas fa-download"></i> 엑셀 다운로드
    </button>
    <!-- Bootstrap 및 Font Awesome 아이콘을 이용한 업로드 버튼 -->
    <button type="button" id="uploadBtn" class="btn btn-primary">
        <i class="fas fa-file-excel"></i> 엑셀 업로드
    </button>
    </div>
    <div id="result"></div>
    <sec:csrfInput/>
</form>

<div style="text-align: left; display: inline-block; width: 50%;">재무상태표</div>
<div style="text-align: right; display: inline-block; width: 49%;">💵단위 : 억원</div>
<div>
   <table class="table table-striped">
        <tr>
            <th>연도</th>
            <c:forEach var="item" items="${list}">
                <th>${item.fiYear}</th>
            </c:forEach>
        </tr>
        <tr>
            <td>자산총계</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiAsset}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>유동자산</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiCasset}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>비유동자산</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiNasset}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>부채총계</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiLiabilities}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>유동부채</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiCliabilities}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>비유동부채</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiNliabilities}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>자본총계</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiTotalcapital}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>지배기업주주지분</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiPcse}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>자본금</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiCapital}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>주식발행초과금</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiSis}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>기타자본</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiOthercapital}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>기타포괄손익누계액</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiAoci}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>이익잉여금</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiRe}</td>
            </c:forEach>
        </tr>
        <tr>
            <td>비지배지분</td>
            <c:forEach var="item" items="${list}">
                <td>${item.fiNci}</td>
            </c:forEach>
        </tr>
    </table>
    </div>
</body>
<script type="text/javascript">
var header = "";
var token = "";
header = $("meta[name='_csrf_header']").attr("content");
token = $("meta[name='_csrf']").attr("content");
$(function(){
	let upFile = $("#upFile")[0];
	var downBtn = $("#downBtn");
	
	// 여기서는 jQuery 객체인 downBtn에 직접 이벤트 리스너를 추가합니다.
	downBtn.on("click", function(){
		location.href = "/entertain/finance/home.do";
	});
	
	upFile.addEventListener("change", function(){
		let form = $("#uploadForm")[0];
		let formData = new FormData(form);
		
		formData.append("upFile", upFile.files[0]);
		
		$.ajax({
			type : "post",
			url : "/entertain/finance/insert.do",
			processData : false,
			contentType : false,
			cache : false,
			data : formData,
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success: function(response) {
			    console.log(response.dataList);
			    if (response.status === "success") {
			        Swal.fire({
			            icon: "success",
			            title: "업로드가 완료되었습니다.",
			            showConfirmButton: false,
			            timer: 1500 // 1.5초 동안 알러트 창 표시
			        }).then(() => {
			            window.location.reload(); // 알러트 창이 닫힌 직후 페이지 리로드
			        });
			    } else {
			        alert("파일 업로드 실패");
			    }
			},

			error: function (xhr, status, error) {
		        console.error(xhr.responseText);
		        alert("파일 업로드 실패");
		    }
		});
	});
});

</script>
<script type="text/javascript">
document.getElementById('uploadBtn').onclick = function() {
    document.getElementById('upFile').click();
};

document.getElementById('upFile').onchange = function() {
    var fileName = document.getElementById('upFile').value.split('\\').pop();
    document.getElementById('uploadBtn').textContent = fileName ? "선택된 파일: " + fileName : "재무재표 업로드 하기";
};
</script>
</html>