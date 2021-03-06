<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.ProtectPetDAO"%>
<%@ page import="dto.ProtectPet"%>
<%@ page import="java.util.ArrayList"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>목격/보호 게시판</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="manifest" href="site.webmanifest"> -->

<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/gijgo.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/slicknav.css">
<link rel="stylesheet" href="css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
	<%@ include file="header.jsp"%>

	<%
		int pageNumber = 1;
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<!-- bradcam_area_start -->
	<div class="bradcam_area breadcam_bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="bradcam_text text-center">
						<h3>목격/보호 게시판</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- bradcam_area_end -->


	<!--================Blog Area =================-->
	<section class="blog_area section-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					<div class="blog_left_sidebar">
						<%
							ProtectPetDAO ppDAO = new ProtectPetDAO();
						ArrayList<ProtectPet> list = ppDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
						%>
						<article class="blog_item">
							<div class="blog_item_img">
								<img class="card-img rounded-0"
									src="img/upload2/<%=list.get(i).getFileName()%>" alt="">

								<%
									if (list.get(i).getDone() == 0) {
								%>
								<a
									href="./protectPet_detail.jsp?id=<%=list.get(i).getPostId()%>"
									class="blog_item_date blog_item_date_yellow">
									<h3>목격</h3>
								</a>
								<%
									} else {
								%>
								<a
									href="./protectPet_detail.jsp?id=<%=list.get(i).getPostId()%>"
									class="blog_item_date blog_item_date_green">
									<h3>보호</h3>
								</a>

								<%
									}
								%>
							</div>
							<div class="blog_details">
								<a class="d-inline-block"
									href="./protectPet_detail.jsp?id=<%=list.get(i).getPostId()%>">
									<h2>
										<%=list.get(i).getBreed()%>
										/
										<%=list.get(i).getGender()%>
										/
										<%=list.get(i).getColor()%>
										/
										<%=list.get(i).getAge()%>
										/
										<%=list.get(i).getWeight()%></h2>
								</a>
								<p><%=list.get(i).getDescription()%></p>
								<ul class="blog-info-link">
									<li><i class="fa fa-user"></i> <%=list.get(i).getAuthor()%></li>
									<li><i class="fa fa-calendar"> <%=list.get(i).getCatchDate()%></i>
									</li>
								</ul>
							</div>
						</article>
						<%
							}
						%>
						<!-- Pagenation -->
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<%
									if (pageNumber != 1) {
								%>
								<li class="page-item"><a
									href="protectPet.jsp?pageNumber=<%=pageNumber - 1%>"
									class="page-link" aria-label="Previous"> <i
										class="ti-angle-left"></i>
								</a></li>
								<%
									}
								int i = 1;
								while (ppDAO.nextPage(i)) {
								if (i == pageNumber) {
								%>
								<li class="page-item active"><a
									href="protectPet.jsp?pageNumber=<%=i%>" class="page-link"><%=i%></a>
								</li>
								<%
									} else {
								%>
								<li class="page-item"><a
									href="protectPet.jsp?pageNumber=<%=i%>" class="page-link"><%=i%></a>
								</li>
								<%
									}
								i++;
								}
								if (ppDAO.nextPage(pageNumber + 1)) {
								%>
								<li class="page-item"><a
									href="protectPet.jsp?pageNumber=<%=pageNumber + 1%>"
									class="page-link" aria-label="Next"> <i
										class="ti-angle-right"></i>
								</a></li>
								<%
									}
								%>
							</ul>
						</nav>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<%
								if (userID == null) {
							%>
							<button
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								onclick="location.href = 'login.jsp'">로 그 인</button>
							<%
								} else {
							%>
							<button
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								onclick="location.href = 'addProtectPet.jsp'">글 쓰 기</button>
							<%
								}
							%>
						</aside>
						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Recent Post</h3>
							<%
								//session
							String a = (String) session.getAttribute("a");
							String b = (String) session.getAttribute("b");
							String c = (String) session.getAttribute("c");
							String d = (String) session.getAttribute("d");
							String e = (String) session.getAttribute("e");

							ArrayList<String> sList = new ArrayList<String>();
							if (a != null) {
								sList.add(a);
							}
							if (b != null) {
								sList.add(b);
							}
							if (c != null) {
								sList.add(c);
							}
							if (d != null) {
								sList.add(d);
							}
							if (e != null) {
								sList.add(e);
							}

							int[] iPostID = new int[4];
							for (int s = 0; s < sList.size(); s++) {
								iPostID[s] = Integer.parseInt(sList.get(s));
							}

							ProtectPetDAO ppdao = new ProtectPetDAO();
							ArrayList<ProtectPet> list2 = ppdao.getSessionList(iPostID);
							for (int j = 0; j < list2.size(); j++) {
							%>
							<div class="media post_item">
								<img src="img/upload2/<%=list2.get(j).getFileName()%>"
									style="width: 80px; height: 80px;" alt="post">
								<div class="media-body">
									<a
										href="protectPet_detail.jsp?id=<%=list2.get(j).getPostId()%>">
										<h3><%=list2.get(j).getBreed()%></h3>
									</a>
									<p><%=list2.get(j).getUploadDate()%></p>
								</div>
							</div>
							<%
								}
							%>
						</aside>

						<aside class="single_sidebar_widget newsletter_widget">
							<h4 class="widget_title">Donation</h4>
							<button
								class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
								type="submit" onclick="location='donation.jsp'">후원하러가기</button>
						</aside>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<%@ include file="footer.jsp"%>

	<!-- JS here -->
	<script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/nice-select.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>
	<script src="js/gijgo.min.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>
	<script>
		$('#datepicker').datepicker({
			iconsLibrary : 'fontawesome',
			disableDaysOfWeek : [ 0, 0 ],
		//     icons: {
		//      rightIcon: '<span class="fa fa-caret-down"></span>'
		//  }
		});
		$('#datepicker2').datepicker({
			iconsLibrary : 'fontawesome',
			icons : {
				rightIcon : '<span class="fa fa-caret-down"></span>'
			}

		});
		var timepicker = $('#timepicker').timepicker({
			format : 'HH.MM'
		});
	</script>
</body>
</html>