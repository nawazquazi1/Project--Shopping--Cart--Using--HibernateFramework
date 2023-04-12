<%@page import="org.*"%>
<%@page import="org.project.DAO.*"%>
<%@page import="org.project.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="org.connection.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Shop</title>

<link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script nonce="ee93e746-554d-4637-bfaa-7353e28ba846">(function(w,d){!function(bv,bw,bx,by){bv[bx]=bv[bx]||{};bv[bx].executed=[];bv.zaraz={deferred:[],listeners:[]};bv.zaraz.q=[];bv.zaraz._f=function(bz){return function(){var bA=Array.prototype.slice.call(arguments);bv.zaraz.q.push({m:bz,a:bA})}};for(const bB of["track","set","debug"])bv.zaraz[bB]=bv.zaraz._f(bB);bv.zaraz.init=()=>{var bC=bw.getElementsByTagName(by)[0],bD=bw.createElement(by),bE=bw.getElementsByTagName("title")[0];bE&&(bv[bx].t=bw.getElementsByTagName("title")[0].text);bv[bx].x=Math.random();bv[bx].w=bv.screen.width;bv[bx].h=bv.screen.height;bv[bx].j=bv.innerHeight;bv[bx].e=bv.innerWidth;bv[bx].l=bv.location.href;bv[bx].r=bw.referrer;bv[bx].k=bv.screen.colorDepth;bv[bx].n=bw.characterSet;bv[bx].o=(new Date).getTimezoneOffset();if(bv.dataLayer)for(const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ,bK)=>({...bJ[1],...bK[1]})))))zaraz.set(bI[0],bI[1],{scope:"page"});bv[bx].q=[];for(;bv.zaraz.q.length;){const bL=bv.zaraz.q.shift();bv[bx].q.push(bL)}bD.defer=!0;for(const bM of[localStorage,sessionStorage])Object.keys(bM||{}).filter((bO=>bO.startsWith("_zaraz_"))).forEach((bN=>{try{bv[bx]["z_"+bN.slice(7)]=JSON.parse(bM.getItem(bN))}catch{bv[bx]["z_"+bN.slice(7)]=bM.getItem(bN)}}));bD.referrerPolicy="origin";bD.src="../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(bv[bx])));bC.parentNode.insertBefore(bD,bC)};["complete","interactive"].includes(bw.readyState)?zaraz.init():bv.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>
</head>
<body>

	<%@include file="/includes/navbar.jsp"%>


	<div class="shop_sidebar_area">

		<div class="widget catagory mb-50">

			<h6 class="widget-title mb-30">Catagories</h6>

			<div class="catagories-menu">
				<%
				ProductDao Dao = new ProductDao(DbConnection.getConnection());

				List<Product> list1 = Dao.getAllProduct();
				for (Product cc : list1) {
				%>
				<ul>
					<li><a href="#"><%=cc.getName()%></a></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>

		<div class="widget brands mb-50">

			<h6 class="widget-title mb-30">Brands</h6>
			<div class="widget-desc">

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="amado">
					<label class="form-check-label" for="amado">Amado</label>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value="" id="ikea">
					<label class="form-check-label" for="ikea">Ikea</label>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="furniture"> <label class="form-check-label"
						for="furniture">Furniture Inc</label>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="factory"> <label class="form-check-label"
						for="factory">The factory</label>
				</div>

				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="artdeco"> <label class="form-check-label"
						for="artdeco">Artdeco</label>
				</div>
			</div>
		</div>

		<div class="widget color mb-50">

			<h6 class="widget-title mb-30">Color</h6>
			<div class="widget-desc">
				<ul class="d-flex">
					<li><a href="#" class="color1"></a></li>
					<li><a href="#" class="color2"></a></li>
					<li><a href="#" class="color3"></a></li>
					<li><a href="#" class="color4"></a></li>
					<li><a href="#" class="color5"></a></li>
					<li><a href="#" class="color6"></a></li>
					<li><a href="#" class="color7"></a></li>
					<li><a href="#" class="color8"></a></li>
				</ul>
			</div>
		</div>

		<div class="widget price mb-50">

			<h6 class="widget-title mb-30">Price</h6>
			<div class="widget-desc">
				<div class="slider-range">
					<div data-min="10" data-max="1000" data-unit="$"
						class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all"
						data-value-min="10" data-value-max="1000" data-label-result="">
						<div class="ui-slider-range ui-widget-header ui-corner-all"></div>
						<span class="ui-slider-handle ui-state-default ui-corner-all"
							tabindex="0"></span> <span
							class="ui-slider-handle ui-state-default ui-corner-all"
							tabindex="0"></span>
					</div>
					<div class="range-price">$10 - $1000</div>
				</div>
			</div>
		</div>
	</div>

	<div class="amado_product_area section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div
						class="product-topbar d-xl-flex align-items-end justify-content-between">

						<div class="total-products">
							<p>Showing 1-8 0f 25</p>
							<div class="view d-flex">
								<a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
								<a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
							</div>
						</div>

						<div class="product-sorting d-flex">
							<div class="sort-by-date d-flex align-items-center mr-15">
								<p>Sort by</p>
								<form action="#" method="get">
									<select name="select" id="sortBydate">
										<option value="value">Date</option>
										<option value="value">Newest</option>
										<option value="value">Popular</option>
									</select>
								</form>
							</div>
							<div class="view-product d-flex align-items-center">
								<p>View</p>
								<form action="#" method="get">
									<select name="select" id="viewProduct">
										<option value="value">12</option>
										<option value="value">24</option>
										<option value="value">48</option>
										<option value="value">96</option>
									</select>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			List<Product> products = ProductDao.listProduct();
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>

			<div class="row">
				<div class="col-12 col-sm-6 col-md-12 col-xl-6">
					<div class="single-product-wrapper">
						<div class="product-img">
							<a href="product-details.jsp?id=<%=p.getId()%>"> <img
								src="img/bg-img/<%=p.getImage()%>" alt=""></a>
						</div>

						<div
							class="product-description d-flex align-items-center justify-content-between">

							<div class="product-meta-data">
								<div class="line"></div>
								<p class="product-price"><%=p.getPrice()%></p>
								<a href="product-details.jsp">
									<h6><%=p.getName()%></h6>
								</a>
							</div>


							<div class="ratings-cart text-right">
								<div class="ratings">
									<i class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i> <i
										class="fa fa-star" aria-hidden="true"></i>
								</div>
								<div class="cart">
									<a href="addtoCartController?id=<%=p.getId()%>"
										data-toggle="tooltip" data-placement="left"
										title="Add to Cart"><img src="img/core-img/cart.png"
										alt=""></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>



		</div>
	</div>

	<%@include file="/includes/section.jsp"%>


	<script src="js/jquery/jquery-2.2.4.min.js"></script>

	<script src="js/popper.min.js"></script>

	<script src="js/bootstrap.min.js"></script>

	<script src="js/plugins.js"></script>

	<script src="js/active.js"></script>

	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
	<script>
  window.dataLayer = window.dataLayer || [];
 

	function gtag() {
		dataLayer.push(arguments);
	} 

	gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vb26e4fa9e5134444860be286fd8771851679335129114"
		integrity="sha512-M3hN/6cva/SjwrOtyXeUa5IuCT0sedyfT+jK/OV+s+D0RnzrTfwjwJHhd+wYfMm9HJSrZ1IKksOdddLuN6KOzw=="
		data-cf-beacon='{"rayId":"7b3c87ea5b308ad9","version":"2023.3.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}'
		crossorigin="anonymous"></script>
</body>

<!--

	Mirrored from preview.colorlib.com/theme/amado/shop.html by
	HTTrack Website Copier/3. x[XR&CO'2014],Thu,06 Apr 2023 19:45:39 GMT-->
</html>