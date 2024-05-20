<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
  .profile-intro {
    text-align: center;
    width: 40%;
    margin: 0 auto;
    /* 넘치는 내용 숨김으로부터 변경 */
    overflow-wrap: break-word; /* 단어 단위로 줄바꿈 */
    white-space: normal; /* 내용을 필요에 따라 줄바꿈 */
    /* text-overflow: ellipsis; 이 속성은 제거 */
    /* 추가적인 스타일링 */
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  }
.game-meta > h5{
	margin: 15px 0 15px 0;
	font-size: 16px; 
	font-weight: 600; 
}
.swiper-button-next:after {
	font-size: 23px;
	color: #333;
	justify-content: left;
} 
.swiper-button-prev:after {
	font-size: 23px;
	color: #333;
	justify-content: right;
}
.swiper-button-next, .swiper-button-prev {
	top: var(--swiper-navigation-top-offset, 43%);
}
.swiper-slide {
	height: 220px;
}
</style>
<div class="central-meta postbox" style="background: none; border: none;">
	<!-- Slider main container -->
	<div class="container">
		<!-- Swiper -->
		<div class="swiper mySwiper">
			<div class="swiper-wrapper" pagination="true"
				pagination-clickable="true" navigation="true" space-between="30"
				centered-slides="true" autoplay-delay="2500"
				autoplay-disable-on-interaction="false">
				<c:forEach items="${goodsNoticeList }" var="goodsNotice" >
					<div class="swiper-slide swiper-slide-1">
						<a href="/goods/notice/userdetail.do?bfNo=${goodsNotice.bfNo }">
							<img alt="" src="${goodsNotice.baSavepath }">
						</a>
					</div>
				</c:forEach>
				<!-- <div class="swiper-slide swiper-slide-1"></div>
				<div class="swiper-slide swiper-slide-2"></div>
				<div class="swiper-slide swiper-slide-3"></div>
				<div class="swiper-slide swiper-slide-4"></div>
				<div class="swiper-slide swiper-slide-5"></div>
				<div class="swiper-slide swiper-slide-6"></div>
				<div class="swiper-slide swiper-slide-7"></div>
				<div class="swiper-slide swiper-slide-8"></div>
				<div class="swiper-slide swiper-slide-9"></div>
				<div class="swiper-slide swiper-slide-10"></div> -->
			</div>
			<div class="swiper-pagination"></div>
		</div>
		<!-- If we need navigation buttons -->
		<div class="swiper-button-prev">
		</div>
		<div class="swiper-button-next">
		</div>
	</div>
</div>

<%-- <div class="central-meta">
	<div class="row remove-ext-40">
		<div class="col-lg-12">
			<h4 class="title">My Artist
				<!-- <a class="" href="#" title="">View All</a> -->
			</h4>
		</div>
		<c:forEach items="${mycommunityList }" var="mycommunity" varStatus="idx">
		
			<div class="col-lg-2 col-md-4 col-sm-6">
				<div class="game-box">
					<div class="memberships">
						<a href="#" title="">
							<img src="${mycommunity.agProfile }" alt="">
						</a></div>
					<div class="game-meta">
						<h5><a href="#" title="">${mycommunity.agId }</a></h5>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div> --%>

<div class="central-meta" style="border: none;">
	<div class="row remove-ext-40">
		<div class="col-lg-12">
			<!-- <h4 class="title" style="margin-bottom: 40px; ">IF ENTER SHOP ARTIST
				<a class="" href="#" title="">View All</a>
			</h4> -->
			<h4 style="margin-bottom:20px;">💜 IF ENTER SHOP ARTIST </h4>
		</div>
		<c:forEach var="list" items="${artistList }">
		<div class="col-lg-2 col-md-4 col-sm-6">
			<div class="game-box">
				<figure style="margin: 0"><a href="shopList.do?agId=${list.agId}" title=""><img src="${list.agIcon }" alt=""></a></figure>
				<div class="game-meta">
					<h5><a href="#" title="">${list.agId }</a></h5>
					<!-- <a href="#" title=""><i class="fa fa-plus-square"></i>가입하기</a> -->
				</div>
			</div>
		</div>
		</c:forEach>
	</div>
</div>
