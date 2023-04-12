<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="search-wrapper section-padding-100">
		<div class="search-close">
			<i class="fa fa-close" aria-hidden="true"></i>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="search-content">
						<form action="#" method="get">
							<input type="search" name="search" id="search"
								placeholder="Type your keyword...">
							<button type="submit">
								<img src="img/core-img/search.png" alt="">
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="main-content-wrapper d-flex clearfix">

		<div class="mobile-nav " style="">

			<div class="amado-navbar-brand">
				<a href="index.jsp"><img src="img/core-img/logo2.png" alt=""></a>
			</div>

			<div class="amado-navbar-toggler">
				<span></span><span></span><span></span>
			</div>
		</div>

		<header class="header-area clearfix">

			<div class="nav-close">
				<i class="fa fa-close" aria-hidden="true"></i>
			</div>

			<div class="logo">
				<a href="index.jsp"><img src="img/core-img/logo2.png" alt=""></a>
			</div>

			<nav class="amado-nav">
				<ul>
					<li class="active"><a href="index.jsp">Home</a></li>
					<li><a href="shop.jsp">Shop</a></li>
					<li><a href="cart.jsp">Cart <span
							class="badge badge-danger"> ${ cart_list.size()}</span></a></li>

					<%
					if (auth != null) {
					%>
					<li><a href="checkout.jsp">Checkout</a></li>
					<li><a href="profile.jsp"><img
							src="pics/<%=auth.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 50px;"> <br>
							<h5><%=auth.getName()%></h5> </a></li>
					<li><a href="LogoutServlet">Logout</a></li>
					<%
					} else {
					%>
					<li><a href="login.jsp">Login</a></li>
					<li><a href="registration.jsp">SingIn</a></li>
					<%
					}
					%>
				</ul>
			</nav>

			<div class="amado-btn-group mt-30 mb-100">
				<a href="#" class="btn amado-btn mb-15">%Discount%</a> <a href="#"
					class="btn amado-btn active">New this week</a>
			</div>

			<div class="cart-fav-search mb-100">
				<a href="cart.jsp" class="cart-nav"><img
					src="img/core-img/cart.png" alt=""> Cart <span
					class="badge badge-danger">${cart_list.size()}</span></a> <a href="#"
					class="fav-nav"><img src="img/core-img/favorites.png" alt="">
					Favourite</a> <a href="#" class="search-nav"><img
					src="img/core-img/search.png" alt=""> Search</a>
			</div>
		</header>
</body>
</html>