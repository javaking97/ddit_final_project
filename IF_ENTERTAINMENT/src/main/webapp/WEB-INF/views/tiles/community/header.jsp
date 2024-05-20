<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<style type="text/css">	

.topbar{
	    display: flex;
    align-items: center;
}
.logo{
	width: 20%;
}
.dropdown {
       position: relative;
       display: inline-block;
   }

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #fff;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    overflow-y: auto;
    max-height: 200px; 
    font-weight: bold;
    font-size: 12px;
    padding: 5px 5px;
}

.dropContent:hover {
	color: #9551fc;
	background-color: #fff;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown-content a:hover {
	background-color: #fff !important;
}

.dropdown-content a:hover {background-color: #f1f1f1}

.dropdown:hover .dropdown-content {
    display: block;
}

.dropdown button::after {
    content: "▼"; 
    margin-left: 5px;
}

.logo > a {
    display: inline-block;
    vertical-align: middle;
    max-width: 100%; 
    width: 100%; 
}
.alarmList > li {
	display: flex;
}
.logoimg-box {
	width: 80px !important;
}
.logoimg-box img {
	width: 100%;
}
.noti_date:before {
    background-color: #c4c4c4;
    border-radius: 50%;
    content: "";
    display: inline-block;
    height: 2px;
    margin: 10px 6px 0;
    vertical-align: top;
    width: 2px
}
.noti_noti{
	color: #a6a6a6;
}

@font-face {
    font-family: 'LOTTERIACHAB';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/LOTTERIACHAB.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	font-family: 'GmarketSansMedium', sans-serif;
}

/* 성이수 */
.top_area_box ul li a {
	padding: 0;
}
/* 성이수 */

.top_area_box ul {
	margin-bottom: -1px;
}

.top_menu {
	margin-right: 0;
	margin-top: 5px;
}

.nav_box {
	background: #773CD5 none repeat scroll 0 0;
	border-radius: 0;
	position: fixed;
	top: 90px;
	z-index: 10;
}

.nav_box li:hover {
	background: #773CD5;
	font-weight: bold;
}

.nav_box li {
	padding: 20px 35px;
}

.animation-blink {
    animation: blink 1s infinite; /* 깜빡거리는 애니메이션을 적용합니다. */
}

@keyframes blink {
    0% {
        opacity: 1;
    }
    50% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}
#Signin{
	border:none;
	background: linear-gradient(rgb(152, 22, 245) 0%, rgb(189, 22, 245) 100%);
    border-radius: 100px;
    color: #fff;
    font-size: 15px;
    font-weight: 700;
    line-height: 18px;
    margin-right: 15px;
    padding: 8px 20px 10px 22px;
}
.chat-setting li {
	border-bottom: 1px solid #e1e8ed;
}
.top-area a {
	color: #9551fc;
	font-size: 15px;
	padding: 0 10px;
}
.goodslink{
	background: no-repeat url(data:image/png;base64,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) 0 0 / contain;
    width: 40px;
    height: 30px !important;
    margin-left: 10px;
}
.setting-area {
	display: flex !important;
	justify-content: flex-end;
	align-items: center;
}
</style>	
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.user.userId" var="idInfo"/>
</sec:authorize>
<!-- 비밀번호 확인 모달 -->
<div class="modal" id="passwordModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title">비밀번호 확인</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <!-- 모달 바디 -->
            <div class="modal-body">
                <!-- 비밀번호 확인 폼 -->
                <form id="pwCheckForm">
                <input type="hidden" id="userNo" name="userNo" data-userno="${loginUser }">
                    <div class="form-group">
                        <label for="pwCheck">비밀번호:</label>
                        <input type="password" class="form-control" name= "userPw" id="userPw" placeholder="비밀번호를 입력하세요">
                    </div>
                   <sec:csrfInput/>
                </form>
            </div>
            <!-- 모달 푸터 -->
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="pwButton">확인</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

		<!-- responsive header 시작 -->
		<div class="topbar stick">
			<div class="logo">
				<a title="" href="/community/main.do">
				<span style="display: inline-block;font-family: 'LOTTERIACHAB';color: #9551fc;font-size: 28px; width: 270px;">
				If Community  <i class="fa-brands fa-waze"></i>
				</span>
		</a>
			</div>
			<c:if test="${not empty UserInfo.agId}">
			    <div class="dropdown">
			        <button style="color: #9551fc; background-color: transparent;width: 100px;height: 50px; font-size: 20px;   margin-top: 2px; border: none;">${UserInfo.agId}</button>
			        <div class="dropdown-content" style="top: 50px; left: 10px; border-radius: 10px;">
			            <c:forEach items="${mycommunity}" var="community">
			                <a class="dropContent" href="/community/artist?agId=${community.agId}">${community.agId}</a>
			            </c:forEach>
			        </div>
			    </div>
			</c:if>

				
		<c:choose>
			<c:when test="${empty idInfo}">
				<div class="top-area top_area_box">
					<ul class="setting-area">
						<li>
							<button id="Signin">Sign in</button>
						</li>
						<li style="border-left: 1px solid #e0e0e0; height: 35px;">
							<a class="goodslink" onclick="location.href='/goods/main.do'">
								<!-- <i class="fa fa-shopping-bag" style="color: #9551fc; aria-hidden=true;"></i> -->
							</a>
						</li>
					</ul>
				</div>
			</c:when>
			<c:otherwise>
				<div class="top-area top_area_box">
		
						<!-- <div class="main-menu top_menu">
							<span>
								<a href="/community/mypage/list.do"><i class="fa fa-user" style="margin-right:10px; color: #9551fc;" aria-hidden="true"></i></a>
								<a href="/community/joined/mymembership.do">멤버십</a>
								<a href="/community/myCollection.do">컬렉션</a>
								<a href="/goods/main.do"><i class="fa fa-shopping-bag" style="color: #9551fc;" aria-hidden="true"></i></a>
							</span>
						</div> -->
		
					<ul class="setting-area">
						<li>
							<a onclick="javascript:location.href='/community/joined/mymembership.do'" style="margin-right:15px;">멤버십</a>
						</li>
						<li>
							<a onclick="javascript:location.href='/community/myCollection.do'" style="margin-right:15px;">컬렉션</a>
						</li>
						<li>
							<a href="#" class="notiBtn" style="position: relative;">
								<i class="fa fa-bell" style="margin-right: 15px; color: #9551fc; font-size: 20px;" aria-hidden="true"></i>
								<em class="noti"></em>
							</a>
							<div class="dropdowns" style="width: 350px; left: -200px">
								<ul class="drops-menu alarmList">
								</ul>
							</div>
						</li>
						<li>
							<a style="margin-right: 10px;">${idInfo }</a>
							<div class="drops-menu user-setting">
								<ul class="chat-setting">
									<li>
										<a href="#" id="editProfileLink" style="height: 50px; line-height: 50px;">
										    <span class="f-online">내 정보 수정</span>
										</a>
									</li>
									<li>
										<a href="#" title="" style="height: 50px; line-height: 50px;" id="logoutBtn">
											<!-- <i class="ti-power-off" style="margin-right: 8px"></i> -->
											로그아웃
										</a>
										<form action="/logout" method="post" id="logoutForm">
											<input type="hidden" name="outFlag" id="outFlag" value="c">
											<sec:csrfInput/>
										</form>
									</li>
								</ul>
							</div>
						</li>
						<li style="border-left: 1px solid #e0e0e0;">
							<a class="goodslink"  onclick="location.href='/goods/main.do'">
								<!-- <i class="fa fa-shopping-bag" style="color: #9551fc; aria-hidden=true;"></i> -->
							</a>
						</li>
<%-- 						<li>
							<a href="#" title="Languages" data-ripple=""><i> 
							<svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="1" stroke-linecap="round" stroke-linejoin="round" class="feather feather-globe">
								<circle cx="12" cy="12" r="10"></circle>
								<line x1="2" y1="12" x2="22" y2="12"></line>
								<path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
							</svg></i><span>한국어</span></a>
							<div class="dropdowns languages">
								<div data-gutter="10" class="row">
									<div class="col-md-3">
										<ul class="dropdown-meganav-select-list-lang">
											<li class="active">
												<a href="#"> 
													<img title="Image Title" alt="Image Alternative text" src="images/flags/US.png">English(US)
												</a>
											</li>
											<li class="active">
												<a href="#"> 
													<img title="Image Title" alt="Image Alternative text" src="images/flags/KOR.png">한국어
												</a>
											</li>
											<li>
												<a href="#"> 
													<img title="Image Title" alt="Image Alternative text" src="images/flags/JP.png">日本語
												</a>
											</li>
											<li>
												<a href="#"> 
													<img title="Image Title" alt="Image Alternative text" src="images/flags/CN.png">简体中文
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</li>
 --%>					</ul>
				</div>
				<!-- 밑 하위 메뉴 -->
			</c:otherwise>
	</c:choose>
</div>
	<nav>
		<ul class="nav-list nav_box">
			<li><a class="" href="/community/artist?agId=${UserInfo.agId}" title="">Feed</a></li>
			<li><a class="" href="/community/artist?agId=${UserInfo.agId}&userType=3" title="">Artist</a> </li>
			<li><a class="" href="/community/feed/live/live.do?agId=${UserInfo.agId}" title="">Live</a></li>
<%-- 			<li><a class="" href="/community/artist/schedule/artistSchedule.do?agId=${UserInfo.agId}" title="">Schedule</a></li> --%>
			<li><a class="" href="/community/artist/schedule/artistSchedule.do?agId=BTS" title="">Schedule</a></li>
			<li><a class="" href="/goods/shopList.do?agId=${UserInfo.agId}" title="">Shop</a></li>
		</ul>
	</nav>
	<!-- nav menu -->
<!-- 헤더 끝 -->


<script type="text/javascript">
$(function () {
	//세션의 userId
	var userId = "${idInfo}";
	
	var Signin = $("#Signin");
	
	Signin.on("click", function () {
		location.href = "/signin.do?flag=c";
	});
 	
	$.ajax({
		url : "/socket/selectAlarm.do?userId=" + userId,
		type : "get",
		beforeSend: function(xhr){
			xhr.setRequestHeader(header, token);
		},
		success : function (res) {
			var html = "";
			if (res.length > 0) {
				$(".noti").css("opacity", "1");
				
				for (var i = 0; i < res.length; i++) {
					
					var notiNo = res[i].notiNo;
					var agIcon = res[i].agIcon;
					if (agIcon == null) {
						agIcon = "/resources/iflogo/iflogo_3.png";
					}
					var notiUrl = res[i].notiUrl;
					var notiContent = res[i].notiContent;
					var notiSender = res[i].notiSender;
					if (notiSender == 'admin001') {
						notiSender = 'IF담당자';
					}
					var Date = res[i].notiDate.toString();;
					var spaceIndex = Date.indexOf(" ");
					var notiDate = Date.substring(0, spaceIndex);
					var notiCnfrm = res[i].notiCnfrm;
					
					html += '<li class="alramli" data-notino="'+notiNo+'">';
					html += '	<div class="logoimg-box">';
					html += '		<img alt="" src="'+agIcon+'">';
					html += '	</div>';
					html += '	<div class="notiInfo">';
					html += '		<div class="mesg-meta" style="width: 100%;">';
					html += '			<h6><a href="'+notiUrl+'">'+notiContent+'</a></h6>';
					html += '			<div class="noti_noti">';
					html += '				<a href="'+notiUrl+'">';
					html += '					<span>'+notiSender+'</span><span class="noti_date">'+notiDate+'</span>';
					html += '				</a>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '</li>';
				}
			}else {
				
				html += '<li class="nonList">';
				html += '	<div class="notiInfo">';
				html += '		<h6>알림이 없습니다.</h6>';
				html += '	</div>';
				html += '</li>';
			}
			$(".alarmList").html(html);
		}
	});
	
	$(".alarmList").on("click", ".alramli", function () {
		var notiNo = $(this).data("notino");
		
		$.ajax({
			url : "/socket/updateReadAlarm.do?notiNo=" + notiNo,
			type : "post",
			beforeSend: function(xhr){
				xhr.setRequestHeader(header, token);
			},
			success : function (res) {
				console.log(res);
			}
		});
	});
	
	var notiBtn = $(".notiBtn");
	
	notiBtn.on("click", function () {
		$(".noti").removeClass("animation-blink");
	});
	
	var logoutBtn = $("#logoutBtn"); 	// 로그아웃 버튼
	var logoutForm = $("#logoutForm");	// 로그아웃 폼
	
	logoutBtn.on("click", function(event){
		event.preventDefault();
	    Swal.fire({
	        title: '로그아웃 하시겠습니까?', 
	        text: "", 
	        icon: 'info', 
	        showCancelButton: true, // 취소 버튼 보이도록 설정
	        confirmButtonColor: '#3085d6', // 삭제 버튼 색상 설정
	        cancelButtonColor: '#d33', // 취소 버튼 색상 설정
	        confirmButtonText: '로그아웃', // 삭제 버튼 텍스트 설정
	        cancelButtonText: '취소' // 취소 버튼 텍스트 설정
	    }).then((result) => {
	        if (result.isConfirmed) { 
	        	logoutForm.submit();
	        }
		});
	});
	
});
$(function(){
	  $('#editProfileLink').click(function(e) {
	        e.preventDefault(); 

	        $('#passwordModal').modal('show');
	    });
		var header = "";
		var token = ""; 
		header = $("meta[name='_csrf_header']").attr("content");
		token = $("meta[name='_csrf']").attr("content");
			

				var pwCheckForm=$("#pwCheckForm");
				var pwButton =$("#pwButton");
				pwButton.on("click",function(){
				var userNo = document.querySelector('#userNo').getAttribute('data-userno');
				var userPw =$("#userPw").val();
				console.log("userNo",userNo);
				console.log("userPw",userPw);
				$.ajax({
					type : 'post',
					url : '/community/pwMyCheck.do',
					beforeSend: function(xhr){	
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/json",
			        data: JSON.stringify({ userNo : userNo , userPw: userPw }),
			        success: function(response) {
			            window.location.href = '/community/mypage/list.do';
			            
			        },
			        error: function(xhr, status, error) {
		                if(xhr.status === 404) {
		                    alert('비밀번호 불일치');
		                } else {
		                    console.error(error);
		                    alert('서버 오류가 발생하였습니다.');
		                }
		            }
			    });
			});
				
				
		});

</script>
