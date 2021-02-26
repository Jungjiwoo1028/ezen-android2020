<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        
        <!-- 아이콘 사용 -->
		<script src="https://kit.fontawesome.com/7018452b37.js" crossorigin="anonymous"></script>

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
                                <a href="${pageContext.request.contextPath}/mypage/mypage_mom/mom_mypage.do?momno=${output.momno}">
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
                                   <!--  <li id="button3" class="tab_button_item">
                                        <a class="tab_button_item_link" href="#tab_page_3">받은 후기</a>
                                    </li> -->
                                </ul>
                            </div>
                        </div>

                        <!-- 탭 내용 영역 -->
                        <div class="row">
                            <div class="col-xs-12 rev_tab_panel">
                                <div class="rev_tab_panel_con">
                                    <!-- 미작성 후기 -->
                                    <div id="tab_page_1">
                                    
                                       <c:forEach var="item" items="${output1}" varStatus="status">
                                         <div class="si_rev_no">
                                               <div class="si_rev_no_tl">
                                                   <!-- 후기작성 부모 프로필사진 -->
                                                   <div class="si_rev_no_prof">
                                                       <img src="${pageContext.request.contextPath}/assets/img/mypage_img/profile.jpg" alt="임시프로필" style="width: 42px; border-radius: 50%;">
                                                   </div>
                                                   <!-- 후기작성 부모 정보 -->
                                                   <div class="si_rev_no_info">
                                                       <h4>${item.name } 시터</h4>
                                                       <h5>${item.si } ${item.gu }</h5>
                                                   </div>
                                               </div>
                                               <button type="button" class="rev_no_btn center-block">후기작성</button> 
                                               <div class="write_rev hide">
                                                  <form id="reviewForm" action="${pageContext.request.contextPath}/mypage/edit_review_ok">
			                                          <p style="color: #858585; margin-top: 10px;">
			                                          	<mark><i class="fas fa-check-circle"></i> 별점과 내용을 입력하세요.</mark>
			                                          <p>
			                                          <div class="rev_rate">
			                                             <input type="hidden" id="rev_edit" name="revno" value="${item.revno}">
			                                             <span style="color: #858585;">별점 |</span> 
			                                             <input type="radio" name="rev_rate" id="rev_rate1" value="1" class="rate_radio" title="1점">
			                                             <label for="rev_rate1"><i class="fas fa-star"></i></label>
			                                             <input type="radio" name="rev_rate" id="rev_rate2" value="2" class="rate_radio" title="2점">
			                                             <label for="rev_rate2"><i class="fas fa-star"></i></label>
			                                             <input type="radio" name="rev_rate" id="rev_rate3" value="3" class="rate_radio" title="3점">
			                                             <label for="rev_rate3"><i class="fas fa-star"></i></label>
			                                             <input type="radio" name="rev_rate" id="rev_rate4" value="4" class="rate_radio" title="4점">
			                                             <label for="rev_rate4"><i class="fas fa-star"></i></label>
			                                             <input type="radio" name="rev_rate" id="rev_rate5" value="5" class="rate_radio" title="5점" checked>
			                                             <label for="rev_rate5"><i class="fas fa-star"></i></label>
			                                          </div>
			                                            <textarea name="contents" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
			                                          <button class="rev_no_btn center-block" type="submit" style="width: 70%; margin-top: 20px; 
			                                          background-color: #ff7000; border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>
			                                       </form>   
                                               </div>
                                           </div>
                                      </c:forEach>
                                   
                                      <!--   <div class="si_rev_no">
                                            <div class="si_rev_no_tl">
                                                <!-- 후기작성 부모 프로필사진 -->
                                              <!--  <div class="si_rev_no_prof">
                                                    <img src="${pageContext.request.contextPath}/assets/img/mypage_img/profile.jpg" alt="임시프로필" style="width: 42px; border-radius: 50%;">
                                                </div>
                                                <!-- 후기작성 부모 정보 -->
                                              <!--   <div class="si_rev_no_info">
                                                    <h4>김○아 시터</h4>
                                                    <h5>서울특별시 강남구</h5>
                                                </div>
                                            </div>
                                            <div class="mng_btn">
                                               <a data-toggle="modal" href="#rev_modal1">
                                                   <button type="button" class="rev_no_btn">후기작성</button> 
                                               </a>
                                            </div>
                                        </div> -->
                                        
                                    </div>

                                    <!-- 작성한 후기 -->
                                    <div id="tab_page_2" class="hide">
                                       <c:forEach var="it" items="${output2}" varStatus="status">
                                          <c:if test="${it.contents != null }">
                                          		<div class="si_rev_no">
	                                               <div class="si_rev_no_tl">
	                                                   <!-- 후기작성 부모 프로필사진 -->
	                                                   <div class="si_rev_no_prof">
	                                                   		<c:if test="${it.isProfile eq '0'}">
	                                                   			<img alt="" src="${pageContext.request.contextPath}/assets/img/defaultImage.jpg" style="width: 42px; border-radius: 50%;"/>
	                                                   		</c:if>
	                                                   		<c:if test="${it.isProfile eq 'y'.charAt(0) }">
	                                                   			<img src="${it.fileUrl }" alt="임시프로필" style="width: 42px; height: 42px; border-radius: 50%;">
	                                                   		</c:if>
	                                                   </div>
	                                                   <!-- 후기작성 부모 정보 -->
	                                                   <div class="si_rev_no_info">
	                                                      <h4>${it.name } <span style="font-size: 0.8em; color: #858585;"> | ${it.si } ${it.gu }</span></h4>
	                                                       <h5></h5>
	                                                       <p class="star" style="margin-top: 5px;">
																<c:if test="${it.rev_rate eq '1'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${it.rev_rate eq '2'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${it.rev_rate eq '3'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${it.rev_rate eq '4'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ccc;"><i class="fas fa-star"></i></span>
																</c:if>
																<c:if test="${it.rev_rate eq '5'.charAt(0) }">
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																	<span style="color: #ff7000;"><i class="fas fa-star"></i></span>
																</c:if>
	                                                       </p>
	                                                       <p>작성일시 ㅣ ${it.reg_date }</p>
	                                                       <p class="rev_text">
	                                                           ${it.contents }
	                                                       </p>
	                                                   </div>   
	                                               </div>
	                                           </div>
                                          </c:if>
                                       </c:forEach>
                                    
                                       <!--  <div class="si_rev_no">
                                            <div class="si_rev_no_tl">
                                    
                                                <div class="si_rev_no_prof">
                                                    <img src="${pageContext.request.contextPath}/assets/img/mypage_img/profile.jpg" alt="임시프로필" style="width: 42px; border-radius: 50%;">
                                                </div>
                                              
                                                <div class="si_rev_no_info">
                                                    <h5>서울특별시 강남구</h5>
                                                    <p class="star">★★★★</p>
                                                    <p>작성일시 ㅣ 2020.11.10 21:00</p>
                                                    <p class="rev_text">
                                                        아이를 잘 케어해줘서 만족스러웠습니다. 간식도 잘 챙겨주고 설거지도 열심히 해줬어요.
                                                    </p>
                                                </div>
                                            </div>
                                        </div> -->
                                    </div>

                                    <!-- 받은 후기 -->
                                    <div id="tab_page_3" class="hide">
                                        <p>받은 후기가 없습니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                       <!-- 후기작성 모달 -->
                   <!--   <div id="rev_modal1" class="modal fade" tabindex="-1" role="dialog"
                        aria-labelledby="modal_label1" aria-hidden="true">
                        <!-- modal dialog -->
                         <!-- <div class="modal-dialog">
                            <!-- modal content -->
                            <!--  <div class="modal-content">
                               <!-- 제목 -->
                            <!--    <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="padding: 10px 0;">
                                     <i class="fas fa-times"></i>
                                 </button>
                                 <h4 class="modal-title" id="modalLabel1" style="font-size: 1.2em; font-weight: bold; padding: 10px 0;">
                                       후기 작성하기
                                  </h4>
                              </div>
                              <div class="modal-body"">
                                 <form>
                                    <div class="rev_rate">
                                       <input type="hidden" id="accept_edit1" name="revno" value="${item.revno}">
                                       <input type="radio" name="rev_rate" id="rev_rate1" value="1" class="rate_radio" title="1점">
                                       <label for="rev_rate1"><i class="fas fa-star"></i></label>
                                       <input type="radio" name="rev_rate" id="rev_rate2" value="2" class="rate_radio" title="2점">
                                       <label for="rev_rate2"><i class="fas fa-star"></i></label>
                                       <input type="radio" name="rev_rate" id="rev_rate3" value="3" class="rate_radio" title="3점">
                                       <label for="rev_rate3"><i class="fas fa-star"></i></label>
                                       <input type="radio" name="rev_rate" id="rev_rate4" value="4" class="rate_radio" title="4점">
                                       <label for="rev_rate4"><i class="fas fa-star"></i></label>
                                       <input type="radio" name="rev_rate" id="rev_rate5" value="5" class="rate_radio" title="5점" checked>
                                       <label for="rev_rate5"><i class="fas fa-star"></i></label>
                                    </div>
                                      <textarea name="rev_no_text" id="" cols="60%" rows="10" placeholder="내용을 입력하세요." style="width: 100%;"></textarea>
                                    <button class="rev_no_btn" type="submit" style="width: 100%; margin-top: 20px; 
                                    background-color: rgb(34, 172, 135); border: 0; height: 30px; border-radius: 5px; color: #ffffff;">저장하기</button>
                                 </form>      
                                 </div>
                             </div>
                         </div> 
                     </div> -->
                    </section>
                    
                </div>
            </div>
        </div>
        
        <!-- Javascript -->
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script>
           <!--Google CDN 서버로부터 jQuery 참조 -->
      <script src="//ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      
      <!-- jQuery Ajax Form plugin CDN -->
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.form/4.2.2/jquery.form.min.js"></script>
      <!-- jQuery Ajax Setup -->
      <script src="${pageContext.request.contextPath}/assets/ajax/ajax_helper.js"></script>
         
        <script>
            $(function() {
               /** 리뷰작성 기능 */
               $("#reviewForm").ajaxForm({
                  method: "POST",
                  success: function(json) {
                     if (json.rt == "OK") {
                        window.location = "${pageContext.request.contextPath}/mypage/mypage_mom/review.do?momno=${login.momno}";
                     }
                  }
               });
               
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
                
                /** 리뷰쓰기버튼 토글 기능 */
                 $(".rev_no_btn").click(function(e) {
                    $(this).toggleClass("hide");
                   $(this).next().toggleClass("hide");
                }); 
              
                /** 삭제 버튼 */
                /** $("#remove_btn").click(function(e) {
                    var result = confirm("정말 삭제하시겠습니까?")

                    if (result) {
                        $(this).parents().find("#tab_page_2").find(".si_rev_no").remove();
                    }
                }); **/
            });
            
        </script>
   </body>
</html>