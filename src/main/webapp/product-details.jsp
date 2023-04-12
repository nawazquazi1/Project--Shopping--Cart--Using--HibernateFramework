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
int Id = Integer.parseInt(request.getParameter("id"));
ProductDao Dao = new ProductDao(DbConnection.getConnection());
Product p = Dao.getSingleProduct(Id);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Product Details</title>

<link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script nonce="032db356-cb78-4f05-b0f7-8110c3ee81c8">(function(w,d){!function(bv,bw,bx,by){bv[bx]=bv[bx]||{};bv[bx].executed=[];bv.zaraz={deferred:[],listeners:[]};bv.zaraz.q=[];bv.zaraz._f=function(bz){return function(){var bA=Array.prototype.slice.call(arguments);bv.zaraz.q.push({m:bz,a:bA})}};for(const bB of["track","set","debug"])bv.zaraz[bB]=bv.zaraz._f(bB);bv.zaraz.init=()=>{var bC=bw.getElementsByTagName(by)[0],bD=bw.createElement(by),bE=bw.getElementsByTagName("title")[0];bE&&(bv[bx].t=bw.getElementsByTagName("title")[0].text);bv[bx].x=Math.random();bv[bx].w=bv.screen.width;bv[bx].h=bv.screen.height;bv[bx].j=bv.innerHeight;bv[bx].e=bv.innerWidth;bv[bx].l=bv.location.href;bv[bx].r=bw.referrer;bv[bx].k=bv.screen.colorDepth;bv[bx].n=bw.characterSet;bv[bx].o=(new Date).getTimezoneOffset();if(bv.dataLayer)for(const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ,bK)=>({...bJ[1],...bK[1]})))))zaraz.set(bI[0],bI[1],{scope:"page"});bv[bx].q=[];for(;bv.zaraz.q.length;){const bL=bv.zaraz.q.shift();bv[bx].q.push(bL)}bD.defer=!0;for(const bM of[localStorage,sessionStorage])Object.keys(bM||{}).filter((bO=>bO.startsWith("_zaraz_"))).forEach((bN=>{try{bv[bx]["z_"+bN.slice(7)]=JSON.parse(bM.getItem(bN))}catch{bv[bx]["z_"+bN.slice(7)]=bM.getItem(bN)}}));bD.referrerPolicy="origin";bD.src="../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(bv[bx])));bC.parentNode.insertBefore(bD,bC)};["complete","interactive"].includes(bw.readyState)?zaraz.init():bv.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>
</head>
<body>
	<%@include file="/includes/navbar.jsp"%>

	<div class="single-product-area section-padding-100 clearfix">
		<div class="container-fluid">
			<div class="col-12 col-lg-12">
				<div class="single_product_desc">

					<div class="product-meta-data">

						<div class="product-img">
							<a href="product-details.jsp?id=<%=p.getId()%>"> <img
								src="img/bg-img/<%=p.getImage()%>" alt=""></a>
						</div>
						<div class="line"></div>
						<p class="product-price">
							$<%=p.getPrice()%></p>
						<a href="product-details.jsp?id=<%=p.getId()%>">
							<h6><%=p.getName()%></h6>
						</a>

						<div
							class="ratings-review mb-15 d-flex align-items-center justify-content-between">
							<div class="ratings">
								<i class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i> <i
									class="fa fa-star" aria-hidden="true"></i>
							</div>
							<div class="review">
								<a href="#">Write A Review</a>
							</div>
						</div>

						<p class="avaibility">
							<i class="fa fa-circle"></i> In Stock
						</p>
					</div>
					<div class="short_overview my-5">
						<p><%=p.getAbout()%></p>
					</div>

					<form class="cart clearfix"
						action="addtoCartController?id=<%=p.getId()%>">
						<div class="cart-btn d-flex mb-50">
							<p>Quantity</p>
							<div class="quantity">
								<span class="qty-minus"
									onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty ) &amp;&amp; qty &gt; 1 ) effect.value--;return false;"><i
									class="fa fa-caret-down" aria-hidden="true"></i></span> <input
									type="number" class="qty-text" id="qty" step="1" min="1"
									max="300" name="quantity" value="1"> <span
									class="qty-plus"
									onclick="var effect = document.getElementById('qty'); var qty = effect.value; if( !isNaN( qty )) effect.value++;return false;"><i
									class="fa fa-caret-up" aria-hidden="true"></i></span>
							</div>
						</div>
						<button type="submit" name="id" value="<%=p.getId()%>"
							class="btn amado-btn"><img src="img/core-img/cart.png"
										alt=""> Add to cart</button>
					</form>
				</div>
			</div>
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
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-23581568-13');
</script>
	<script defer
		src="https://static.cloudflareinsights.com/beacon.min.js/vb26e4fa9e5134444860be286fd8771851679335129114"
		integrity="sha512-M3hN/6cva/SjwrOtyXeUa5IuCT0sedyfT+jK/OV+s+D0RnzrTfwjwJHhd+wYfMm9HJSrZ1IKksOdddLuN6KOzw=="
		data-cf-beacon='{"rayId":"7b3c87ec997f8ad3","version":"2023.3.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}'
		crossorigin="anonymous"></script>
</body>

<!-- Mirrored from preview.colorlib.com/theme/amado/product-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Apr 2023 19:45:41 GMT -->
</html>