<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>맘시터 > 검색 결과</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/guide_danger_yj.css" />
        <!-- fontawesome(글리피콘) 적용 -->
		<script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
	</head>

	<body>
		<div class="container">
			<div class="row">
			<header>
			  <%@ include file="../index_header.jsp" %>
			</header>
			<!-- header end-->
                <div class="col-xs-12 nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/customer_center.do">맘시터</a>
                    </li>
                    <span>></span>
                    <li>
                        <a href="#">검색 결과</a>
                    </li>
                </div>
                    <div class="col-xs-12 input">
                        <span class="glyphicon glyphicon-search" id="glyphicon"></span>
                        <form role="search" class="search search-full" data-search
                        data-instant="true" autocomplete="off" accept-charset="UTF-8" method="GET">
                        <input type="search" name="query" id="query" placeholder="검색" aria-label="검색">
                        </form>
                    </div>
                    <div class="col-xs-12 sidebar">
                        <div class="col-xs-10 sidebar_1">카테고리별
                        </div>
                        <div class="col-xs-2 sidebar_2">
                            <span class="glyphicon glyphicon-chevron-down" id="glyphicon_2">    
                            </span>
                        </div>
                    </div>
                    <div class="col-xs-12 section">
                        <div class="section_header">
                        <h1>모든 카테고리에서 "부모회원" 검색 결과 101개</h1>
                        </div>
                    </div>
                    <div class="col-xs-12 footer_content">
                        <a href="#">[부모회원 가이드] 시터님 채용하기</a>
                    </div>
                    <div class="col-xs-12 footer_link">
                        <a href="#">맘시터</a>
                        <span> > </span>
                        <a href="#">이용가이드</a>
                        <span> > </span>
                        <a href="#">부모회원 가이드</a>
                    </div>
                    <div class="col-xs-12">
                        '한 경우 - 아래 활동 제한 및 유의사항 안내 사유가 '누적'된 경우(총 3회 접수 시) - 그 외, 고객안전관리팀이 판단하기에 맘시터 <em>부모</em><em>회원</em>으로 활동이 부적절하다고 판단되는 경우 (내부 팀 논의를 거쳐서 결정)
                    </div>
                        <div class="col-xs-12 footer">
                    </div>
			</div> <!-- row 끝 -->
        </div> <!-- container 끝 -->
        <!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	</body>
</html>