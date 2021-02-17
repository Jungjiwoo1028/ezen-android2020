<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>아부해 고객센터</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/guide_yj.css" />
        <script src="https://kit.fontawesome.com/f27ac0bcc1.js" crossorigin="anonymous"></script>
        
        <style type="text/css">
        	ul, li {
        		list-style: none;
        		padding: 0;
        		margin: 0;
        	}
        	
        </style>
	</head>

	<body>
		<div class="container">
			<div class="row">
			
			<%@ include file="../index_header.jsp" %>
			
                <div class="col-xs-12 nav">
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/customer_center.do">아부해 고객센터</a>
                    </li>
                    <span>></span>
                    <li>
                        <a href="${pageContext.request.contextPath}/customer/faq.do">자주하는 질문</a>
                    </li>
                </div>
                    <div class="col-xs-12 input">
                        <form action="${pageContext.request.contextPath}/customer/cus_search.do" role="search" class="search search-full" data-search
		                data-instant="true" autocomplete="off" accept-charset="UTF-8" method="GET">
		                	<input type="search" name="keyword" id="keyword" value="${keyword}" placeholder="검색" aria-label="검색">
		                	<button type="submit">검색</button>
		                </form>
                    </div>
                    <div class="col-xs-12 section">
                        <div class="section_header">
                        <!-- 첫번째 카테고리 (자주묻는 질문) -->
                        	<h2>자주묻는 질문</h2>
                        </div>
                        
                        <!-- 첫번째 서브 카테고리 게시글 목록 조회 -->
                        <div class="col-xs-12 section_middle">
                        	<!-- sub_category1 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p> 
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<!-- 카테고리=1(이용가이드) / 서브카테고리=1(이용가이드)의 작성글 제목 조회 -->
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==1}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
	                   		<!-- sub_category1의 작성글 -->
                            <div class="col-xs-12 section_title">
	                    		<c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 1}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    					
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
	                    	</div>
	                    	<div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                    </div>
                    
                    	<!-- 두번째 서브 카테고리 게시글 목록 조회하기 -->
	                    <div class="col-xs-12 section_middle">
	                    	<!-- sub_category2 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==2}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
	                   		</c:choose>
	                   		
	                   		<!-- sub_category2의 작성글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<%-- sub_category2의 게시글 --%>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 2}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                     <div class="col-xs-12 section_title_2">
		                        <a href="#">문서 8개 모두 보기</a>
		                    </div>
	                    </div>
                    
                    	<!-- 세번째 서브 카테고리 게시글 목록 조회 -->
	                    <div class="col-xs-12 section_middle">
	                    	<!-- sub_category3 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==3}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category3의 작성글 -->
	                        <div class="col-xs-12 section_title">
	                        	<c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 3}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                    </div>
	                    
	                    <!-- 네번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category4 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==4}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category4의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 4}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                     <!-- 다섯번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category4 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==5}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category4의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 5}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                     <!-- 여섯섯번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category6 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==6}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category6의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 6}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                    <!-- 일곱섯섯번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category7 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==7}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category7의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 7}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                     <!-- 여덟섯섯번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category8 -->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==8}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category9의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 8}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                     <!-- 열번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category10-->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==10}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category10의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 10}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                     <!-- 열한번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category11-->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==11}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category11의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 11}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
	                       <!-- 열두번째 서브 카테고리 -->
	                    <div class="col-xs-12 section_middle">
                        	<!-- sub_category12-->
                        	<c:choose>
	                   			<c:when test="${out==null || fn:length(output) == 0}">
	                   				<p>조회결과가 없습니다.</p>
	                   			</c:when>
	                   			
	                   			<c:otherwise>
	                   				<c:forEach var="item_cate" items="${out}" varStatus="status">
	                   					<c:if test="${item_cate.cateno == 1 && item_cate.subcateno==12}">
	                   						<h2>${item_cate.sub_category}</h2>
	                   					</c:if>
	                   				</c:forEach>
	                   			</c:otherwise>
                   			</c:choose>

							<!-- sub_category12의 게시글 -->
	                        <div class="col-xs-12 section_title">
		                        <c:choose>
	                    			<c:when test="${output==null || fn:length(output) == 0}">
	                    				<p>조회결과가 없습니다.</p>
	                    			</c:when>
	                    			
	                    			<c:otherwise>
	                    				<c:forEach var="item" items="${output}" varStatus="status">
	                    					
	                    					<%-- 상세페이지 URL --%>
	                    					<c:url value="/customer/cus_view.do" var="viewUrl">
	                    						<c:param name="boardnum" value="${item.boardnum}"/>
	                    					</c:url>
	                    					<c:if test="${item.cateno==1 && item.subcateno == 12}">
	                    						<ul>
		                    						<li><a href="${viewUrl}">[${item.sub_category}] ${item.title}</a></li>
		                    					</ul>
	                    					</c:if>
	                    				</c:forEach>
	                    			</c:otherwise>
	                    		</c:choose>
		                    </div>
		                    
		                    <div class="col-xs-12 section_title_2">
	                       		<a href="#">문서 7개 모두 보기</a>
	                    	</div>
	                     </div>
	                     
                    </div>
                    <div class="col-xs-12 footer">
                    </div>
			</div> <!-- row 끝 -->
        </div> <!-- container 끝 -->

	
		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script> <!-- jquery 파일명 수정 -->		
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		//$(function() {
		//	$("#menu").load("../index_header.html");
		//});
		</script>
	</body>
</html>