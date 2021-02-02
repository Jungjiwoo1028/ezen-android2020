<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

    <!-- header css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/index_header_login_sitter.css" />
  </head>
  <body>
    <div id="header">
      <!-- header : 하리-->
      <header>
        <div class="header_wrap col-xs-12">
          <div class="header">
            <div class="flex_row main_menu">
              <!-- 메뉴 모달 열기-->
              <a data-toggle="modal" href="#menu_modal">
                <p><i class="fas fa-bars"> </i></p>
              </a>

              <a href="${pageContext.request.contextPath}/">
                <img src="${pageContext.request.contextPath}/assets/img/logo(1).png"" class="logo" />
              </a>
            </div>
            <div class="flex_row">
              <a href="${pageContext.request.contextPath}/join/join.do"><button id="header_join" class="join">가입하기</button></a>
              <i id="header_search" class="fas fa-search header_search_btn"></i>
            </div>
          </div>
        </div>
        <div class="searchbar_wrap" style="display: none">
          <div class="search_block search_sitter"><img src="${pageContext.request.contextPath}/assets/img/header_sittersearch.png" />맘시터 찾기</div>
          <div class="search_block search_job"><img src="${pageContext.request.contextPath}/assets/img/header_jobsearch.png" />일자리 찾기</div>
        </div>
      </header>
      <!-- header end-->

      <!-- modal -->

      <div id="menu_modal" class="modal col-xs-12 fade" data-toggle="tab" tabindex="-1" role="dialog" aria-labelledby="menu_modal_label" aria-hidden="true">
        <!-- modal content-->
        <div class="modal_content col-xs-9">
          <!-- modal header -->
          <div class="modal_group">
            <div class="modal_header">
              <div class="user_name_group">
                <p class="welcome">안녕하세요</p>
                <p class="cus_name">정지우 시터님</p>
              </div>
              <a href="#" id="logout_btn"
                ><button type="button" class="modal_btn">
                  <p class="logout_btn">로그아웃</p>
                </button></a
              >
            </div>
            <!-- modal header end-->

            <!-- modal body-->
            <div class="modal_body">
              <div class="sitter_search">
                <button type="button" id="jobsc_btn">
                  <p class="jobsc_txt">일자리 찾기</p>
                </button>
              </div>
              <div class="icon_link_group">
                <div class="user_menu" id="menu_mypage">
                  <div class="img_bg">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_Human.png" />
                  </div>
                  <span class="um_txt">마이페이지</span>
                </div>
                <div class="user_menu" id="menu_application">
                  
                  <div class="img_bg">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_Pen.png" />
                  </div>
                  <span class="um_txt">신청서 수정</span>
                </div>
                <div class="user_menu" id="menu_buy">

                  <div class="img_bg">
                    <img src="${pageContext.request.contextPath}/assets/img/noun_ticket.png" />
                  </div>

                  <span class="um_txt">지원권 구매</span>
                </div>
              </div>
            </div>
          </div>
          <!-- modal body end-->
          <div class="divider"></div>
          <!-- modal footer -->
          <div class="modal_footer modal_group">
            <a href="#" id="menu_cert">
              <p>인증관리</p>
            </a>
            <a href="#" id="other_sitter">
              <p>다른 시터 프로필 보기</p>
            </a>
            <a href="#" id="intro_btn">
              <p>서비스 소개</p>
            </a>
            <a href="#" id="notice_btn">
              <p>공지사항</p>
            </a>
            <a href="#" id="cus_btn">
              <p>고객센터</p>
            </a>
          </div>

          <!-- modal footer end -->
        </div>
        <!-- modal content end-->
      </div>
      <!-- modal end -->
    </div>
    <!--삭제 예정-->
    <!-- Javascript -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
    <!-- jquery 파일명 수정 -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <!--삭제 예정-->
    <script>
      $(function () {
        $("#logout_btn").click(function (e) {
          location.replace("${pageContext.request.contextPath}/index.do");
        });
        $("#jobsc_btn").click(function (e) {
          location.replace("${pageContext.request.contextPath}/search/job_search.do");
        });
        $("#menu_mypage").click(function (e) {
          location.replace("${pageContext.request.contextPath}/mypage/mypage_sitter/sitter_mypage.do");
        });
        $("#menu_application").click(function (e) {
          location.replace("${pageContext.request.contextPath}/mypage/mypage_sitter/update_profile.do");
        });
        $("#menu_buy").click(function (e) {
          location.replace("${pageContext.request.contextPath}/buy/sitter_ticket.do");
        });
        $("#menu_cert").click(function (e) {
          location.replace("${pageContext.request.contextPath}/mypage/mypage_sitter/certify.do");
        });
        $("#other_sitter").click(function (e) {
          location.replace("${pageContext.request.contextPath}/search/sitter_search.do");
        });
        $("#intro_btn").click(function (e) {
          location.replace("${pageContext.request.contextPath}/abu-service/introduce.do");
        });
        $("#notice_btn").click(function (e) {
          location.replace("${pageContext.request.contextPath}/customer/notice_site.do");
        });
        $("#cus_btn").click(function (e) {
          location.replace("${pageContext.request.contextPath}/customer/customer_center.do");
        });
      });
    </script>
  </body>
</html>
