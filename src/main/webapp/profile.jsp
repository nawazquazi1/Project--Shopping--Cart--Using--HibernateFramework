<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">
<script nonce="032db356-cb78-4f05-b0f7-8110c3ee81c8">(function(w,d){!function(bv,bw,bx,by){bv[bx]=bv[bx]||{};bv[bx].executed=[];bv.zaraz={deferred:[],listeners:[]};bv.zaraz.q=[];bv.zaraz._f=function(bz){return function(){var bA=Array.prototype.slice.call(arguments);bv.zaraz.q.push({m:bz,a:bA})}};for(const bB of["track","set","debug"])bv.zaraz[bB]=bv.zaraz._f(bB);bv.zaraz.init=()=>{var bC=bw.getElementsByTagName(by)[0],bD=bw.createElement(by),bE=bw.getElementsByTagName("title")[0];bE&&(bv[bx].t=bw.getElementsByTagName("title")[0].text);bv[bx].x=Math.random();bv[bx].w=bv.screen.width;bv[bx].h=bv.screen.height;bv[bx].j=bv.innerHeight;bv[bx].e=bv.innerWidth;bv[bx].l=bv.location.href;bv[bx].r=bw.referrer;bv[bx].k=bv.screen.colorDepth;bv[bx].n=bw.characterSet;bv[bx].o=(new Date).getTimezoneOffset();if(bv.dataLayer)for(const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ,bK)=>({...bJ[1],...bK[1]})))))zaraz.set(bI[0],bI[1],{scope:"page"});bv[bx].q=[];for(;bv.zaraz.q.length;){const bL=bv.zaraz.q.shift();bv[bx].q.push(bL)}bD.defer=!0;for(const bM of[localStorage,sessionStorage])Object.keys(bM||{}).filter((bO=>bO.startsWith("_zaraz_"))).forEach((bN=>{try{bv[bx]["z_"+bN.slice(7)]=JSON.parse(bM.getItem(bN))}catch{bv[bx]["z_"+bN.slice(7)]=bM.getItem(bN)}}));bD.referrerPolicy="origin";bD.src="../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(bv[bx])));bC.parentNode.insertBefore(bD,bC)};["complete","interactive"].includes(bw.readyState)?zaraz.init():bv.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>

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

		<div class="mobile-nav">

			<div class="amado-navbar-brand">
				<a href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
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
				<a href="index.jsp"><img src="img/core-img/logo.png" alt=""></a>
			</div>

			<nav class="amado-nav">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="shop.jsp">Shop</a></li>
					<li class="active"><a href="product-details.jsp">Product</a></li>
					<li><a href="cart.jsp">Cart</a></li>
					<li><a href="checkout.jsp">Checkout</a></li>
					<li><a href="profile.jsp">Profile</a></li>
				</ul>
			</nav>

			<div class="amado-btn-group mt-30 mb-100">
				<a href="#" class="btn amado-btn mb-15">%Discount%</a> <a href="#"
					class="btn amado-btn active">New this week</a>
			</div>

			<div class="cart-fav-search mb-100">
				<a href="cart.jsp" class="cart-nav"><img
					src="img/core-img/cart.png" alt=""> Cart <span>(0)</span></a> <a
					href="#" class="fav-nav"><img src="img/core-img/favorites.png"
					alt=""> Favourite</a> <a href="#" class="search-nav"><img
					src="img/core-img/search.png" alt=""> Search</a>
			</div>

			<div class="social-info d-flex justify-content-between">
				<a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a> <a
					href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a> <a
					href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a> <a
					href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
			</div>
		</header>




		<h1>HELLO USER</h1>
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
												href="index.jsp">Home</a></li>
											<li class="nav-item"><a class="nav-link" href="shop.jsp">Shop</a>
											</li>
											<li class="nav-item"><a class="nav-link"
												href="product-details.jsp">Product</a></li>
											<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart</a>
											</li>
											<li class="nav-item"><a class="nav-link"
												href="checkout.jsp">Checkout</a></li>
											<li class="nav-item"><a class="nav-link"
												href="profile.jsp">Profile</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</footer>

		<script src="js/jquery/jquery-2.2.4.min.js"></script>

		<script src="js/popper.min.js"></script>

		<script src="js/bootstrap.min.js"></script>

		<script src="js/plugins.js"></script>

		<script src="js/active.js"></script>

		<script async
			src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
</body>
</html>