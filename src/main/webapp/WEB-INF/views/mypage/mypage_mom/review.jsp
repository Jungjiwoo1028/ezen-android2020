<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<title>아이를부탁해</title>

		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/favicon.ico" />

		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

		<!-- noto Sans 웹 폰트 적용 -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/notosans.css" />
        
        <!-- icon 참조 -->
        <script src="https://kit.fontawesome.com/12ac058ac7.js" crossorigin="anonymous"></script>

        <!-- css 참조 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/upd_mpm_detail.css">
    </head>

    <body>
        <div id="app">
            <div class="container">
                <div class="wrap_review">
                     <!-- header -->
                     <header class="mp_detail_tl">
                        <div class="row">
                            <div class="col-xs-12 mp_detail_tl_in">
                                <a href="${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do">
                                    <i class="fas fa-times"></i>
                                </a>
                                <h3 class="center-block">후기 관리</h3>
                            </div>
                        </div>
                    </header>

                    <!-- content1 -->
                    <section class="group1_review">
                        <!-- 탭버튼 -->
                        <div class="row">
                            <div class="col-xs-12 rev_tab">
                                <!-- 탭 버튼 영역 -->
                                <ul class="rev_tab_button">
                                    <li id="button1" class="tab_button_item fi_selected">
                                        <a class="tab_button_item_link selected" href="#tab_page_1">미작성 후기</a>
                                    </li>
                                    <li id="button2" class="tab_button_item">
                                        <a class="tab_button_item_link" href="#tab_page_2">작성한 후기</a>
                                    </li>
                                    <li id="button3" class="tab_button_item">
                                        <a class="tab_button_item_link" href="#tab_page_3">받은 후기</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <!-- 탭 내용 영역 -->
                        <div class="row">
                            <div class="col-xs-12 rev_tab_panel">
                                <div class="rev_tab_panel_con">
                                    <!-- 미작성 후기 -->
                                    <div id="tab_page_1">
                                        <div class="si_rev_no">
                                            <div class="si_rev_no_tl">
                                                <!-- 후기작성 부모 프로필사진 -->
                                                <div class="si_rev_no_prof">
                                                    <img src="${pageContext.request.contextPath}/assets/img/mypage_img/profile.jpg" alt="임시프로필" style="width: 42px; border-radius: 50%;">
                                                </div>
                                                <!-- 후기작성 부모 정보 -->
                                                <div class="si_rev_no_info">
                                                    <h4>김○아 시터</h4>
                                                    <h5>서울특별시 강남구</h5>
                                                </div>
                                            </div>
                                            <div class="mng_btn">
                                            	<a data-toggle="modal" href="#rev_modal1">
	                                                <button type="button" class="rev_no_btn">채용후기</button> 
                                            	</a>
                                            	<a data-toggle="modal" href="#rev_modal2">
	                                                <button type="button" class="rev_no_btn">인터뷰후기</button>
                                            	</a>
                                            	<a data-toggle="modal" href="#rev_modal3">
	                                                <button type="button" class="rev_no_btn">실패후기</button>
                                            	</a>    
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <!-- 작성한 후기 -->
                                    <div id="tab_page_2" class="hide">
                                        <div class="si_rev_no">
                                            <div class="si_rev_no_tl">
                                                <!-- 후기작성 부모 프로필사진 -->
                                                <div class="si_rev_no_prof">
                                                    <img src="${pageContext.request.contextPath}/assets/img/mypage_img/profile.jpg" alt="임시프로필" style="width: 42px; border-radius: 50%;">
                                                </div>
                                                <!-- 후기작성 부모 정보 -->
                                                <div class="si_rev_no_info">
                                                    <h5>서울특별시 강남구</h5>
                                                    <p class="star">★★★★</p>
                                                    <p>작성일시 ㅣ 2020.11.10 21:00</p>
                                                    <p class="rev_text">
                                                        아이를 잘 케어해줘서 만족스러웠습니다. 간식도 잘 챙겨주고 설거지도 열심히 해줬어요.
                                                    </p>
                                                </div>
                                            </div>
                                            <!-- <div class="rev_button">
                                                <a href="#" style="width:100%;">
                                                    <button id="remove_btn" class="rev_no_btn" type="button">
                                                        삭제하기
                                                    </button>
                                                </a>
                                            </div> -->
                                        </div>
                                    </div>

                                    <!-- 받은 후기 -->
                                    <div id="tab_page_3" class="hide">
                                        <p>받은 후기가 없습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                       <!-- 후기작성 모달 -->
                       <form>
							<div id="rev_modal1" class="modal fade" tabindex="-1" role="dialog"
								aria-labelledby="modal_label1" aria-hidden="true">
							   <!-- modal dialog -->
								<div class="modal-dialog">
								    <!-- modal content -->
									<div class="modal-content">
									    <!-- 제목 -->
										<div class="modal-header">
										    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
										    	<i class="fas fa-times"></i>
											</button>
											<h4 class="modal-title" id="modalLabel1" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
										         채용후기 작성
										    </h4>
										</div>
										<div class="modal-body"">
								        	<textarea name="rev_no_text" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
											<button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
											background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>      
							            </div>
							        </div>
							    </div>
							</div>
							
							<div id="rev_modal2" class="modal fade" tabindex="-1" role="dialog"
								aria-labelledby="modal_label2" aria-hidden="true">
							   <!-- modal dialog -->
								<div class="modal-dialog">
								    <!-- modal content -->
									<div class="modal-content">
									    <!-- 제목 -->
										<div class="modal-header">
										    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
										    	<i class="fas fa-times"></i>
											</button>
											<h4 class="modal-title" id="modalLabel2" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
										         인터뷰후기 작성
										    </h4>
										</div>
										<div class="modal-body"">
								        	<textarea name="rev_no_text" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
											<button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
											background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>      
							            </div>
							        </div>
							    </div>
							</div>
							<div id="rev_modal3" class="modal fade" tabindex="-1" role="dialog"
								aria-labelledby="modal_label3" aria-hidden="true">
							   <!-- modal dialog -->
								<div class="modal-dialog">
								    <!-- modal content -->
									<div class="modal-content">
									    <!-- 제목 -->
										<div class="modal-header">
										    <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
										    	<i class="fas fa-times"></i>
											</button>
											<h4 class="modal-title" id="modalLabel3" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
										         실패후기 작성
										    </h4>
										</div>
										<div class="modal-body"">
								        	<textarea name="rev_no_text" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
											<button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
											background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>      
							            </div>
							        </div>
							    </div>
							</div>
                       </form>
                    </section>
                    
                    
                </div>
            </div>
        </div>

		<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

        <script>
            $(function() {
              /** 탭 버튼 클릭 처리 */
                $(".tab_button_item").click(function(e) {
                    e.preventDefault();
                    $(".tab_button_item").not(this).removeClass("fi_selected");
                    $(this).addClass("fi_selected");

                    $(".tab_button_item").not(this).find("a").removeClass("selected");
                    $(this).find("a").addClass("selected");

                    var target2 = $(this).find("a").attr("href");
                    $(target2).removeClass("hide");
                    $(".rev_tab_panel_con > div").not($(target2)).addClass("hide");
                });
                
                 /** 삭제 버튼 */
                 $("#remove_btn").click(function(e) {
                    var result = confirm("정말 삭제하시겠습니까?")

                    if (result) {
                        $(this).parents().find("#tab_page_2").find(".si_rev_no").remove();
                    }
                }); 
            });
        </script>
	</body>
</html>