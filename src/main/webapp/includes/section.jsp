<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	</div>
	<section class="newsletter-area section-padding-100-0">
		<div class="container">
			<div class="row align-items-center">

				<div class="col-12 col-lg-6 col-xl-7">
					<div class="newsletter-text mb-100">
						<h2>
							Subscribe for a <span>25% Discount</span>
						</h2>
						<p>Nulla ac convallis lorem, eget euismod nisl. Donec in
							libero sit amet mi vulputate consectetur. Donec auctor interdum
							purus, ac finibus massa bibendum nec.</p>
					</div>
				</div>

				<div class="col-12 col-lg-6 col-xl-5">
					<div class="newsletter-form mb-100">
						<form action="#" method="post">
							<input type="email" name="email" class="nl-email"
								placeholder="Your E-mail"> <input type="submit"
								value="Subscribe">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


	<footer class="footer_area clearfix">
		<div class="container">
			<div class="row align-items-center">

				<div class="col-12 col-lg-4">
					<div class="single_widget_area">

						<div class="footer-logo mr-50">
							<a href="index.jsp"><img src="img/core-img/logo2.png" alt=""></a>
						</div>

						<p class="copywrite">
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com/" target="_blank">Colorlib</a>
						</p>
					</div>
				</div>

				<div class="col-12 col-lg-8">
					<div class="single_widget_area">

						<div class="footer_menu">
							<nav class="navbar navbar-expand-lg justify-content-end">
								<button class="navbar-toggler" type="button"
									data-toggle="collapse" data-target="#footerNavContent"
									aria-controls="footerNavContent" aria-expanded="false"
									aria-label="Toggle navigation">
									<i class="fa fa-bars"></i>
								</button>
								<div class="collapse navbar-collapse" id="footerNavContent">
									<ul class="navbar-nav ml-auto">
										<li class="nav-item active"><a class="nav-link"
											href="index.jsp"> Home</a></li>
										<li class="nav-item"><a class="nav-link" href="shop.jsp">
												Shop</a></li>
										<li class="nav-item"><a class="nav-link"
											href="product-details.jsp"> Product</a></li>
										<li class="nav-item"><a class="nav-link" href="cart.jsp">
												Cart</a></li>
										<%
										if (auth != null) {
										%>


										<li class="nav-item"><a class="nav-link"
											href="checkout.jsp"> Checkout</a></li>
										<li class="nav-item"><a class="nav-link"
											href="LogoutServlet">Logout</a></li>
										<li class="nav-item"><a class="nav-link"
											href="profile.jsp"><img src="pics/<%=auth.getProfile()%>"
												class="img-fluid"
												style="border-radius: 50%; max-width: 100px;"><%=auth.getName()%></a></li>
										<%
										} else {
										%>
										<li class="nav-item"><a class="nav-link"
											href="login.jsp">Login</a></li>
										<li class="nav-item"><a class="nav-link"
											href="registration.jsp">SingIn</a></li>
										<%
										}
										%>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>