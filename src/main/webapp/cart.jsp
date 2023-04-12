<!DOCTYPE html>
<%@page import="org.*"%>
<%@page import="org.project.DAO.*"%>
<%@page import="org.project.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="org.connection.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("person", auth);
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbConnection.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<title>Cart</title>

<link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script nonce="25278c00-a6e0-4cd3-99aa-70726ff0a413">(function(w,d){!function(bv,bw,bx,by){bv[bx]=bv[bx]||{};bv[bx].executed=[];bv.zaraz={deferred:[],listeners:[]};bv.zaraz.q=[];bv.zaraz._f=function(bz){return function(){var bA=Array.prototype.slice.call(arguments);bv.zaraz.q.push({m:bz,a:bA})}};for(const bB of["track","set","debug"])bv.zaraz[bB]=bv.zaraz._f(bB);bv.zaraz.init=()=>{var bC=bw.getElementsByTagName(by)[0],bD=bw.createElement(by),bE=bw.getElementsByTagName("title")[0];bE&&(bv[bx].t=bw.getElementsByTagName("title")[0].text);bv[bx].x=Math.random();bv[bx].w=bv.screen.width;bv[bx].h=bv.screen.height;bv[bx].j=bv.innerHeight;bv[bx].e=bv.innerWidth;bv[bx].l=bv.location.href;bv[bx].r=bw.referrer;bv[bx].k=bv.screen.colorDepth;bv[bx].n=bw.characterSet;bv[bx].o=(new Date).getTimezoneOffset();if(bv.dataLayer)for(const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ,bK)=>({...bJ[1],...bK[1]})))))zaraz.set(bI[0],bI[1],{scope:"page"});bv[bx].q=[];for(;bv.zaraz.q.length;){const bL=bv.zaraz.q.shift();bv[bx].q.push(bL)}bD.defer=!0;for(const bM of[localStorage,sessionStorage])Object.keys(bM||{}).filter((bO=>bO.startsWith("_zaraz_"))).forEach((bN=>{try{bv[bx]["z_"+bN.slice(7)]=JSON.parse(bM.getItem(bN))}catch{bv[bx]["z_"+bN.slice(7)]=bM.getItem(bN)}}));bD.referrerPolicy="origin";bD.src="../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(bv[bx])));bC.parentNode.insertBefore(bD,bC)};["complete","interactive"].includes(bw.readyState)?zaraz.init():bv.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>
</head>
<body>

	<%@include file="/includes/navbar.jsp"%>

	<div class="cart-table-area section-padding-100">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-lg-12">
					<div class="cart-title mt-60">
						<h2>Shopping Cart</h2>
					</div>
						<table class="table table-responsive">
							<thead>
								<tr>
									<th></th>
									<th>Name</th>
									<th>Price</th>
									<th>Quantity</th>
									<th>Remove</th>
								</tr>
							</thead>
							<tbody>
								<%
								if (cart_list != null) {
									for (Cart c : cartProduct) {
								%>
								<tr>
									<td class="cart_product_img"><a href="product-details.jsp?id=<%=c.getId()%>"><img
											src="img/bg-img/<%=c.getImage()%>" alt="Product"></a></td>
									<td class="cart_product_desc">
										<h5><%=c.getName()%></h5>
									</td>
									<td class="price"><span> $<%=c.getPrice()%></span></td>
									<td class="qty">
										<div class="qty-btn d-flex">
											<div class="form-group d-flex justify-content-between">
												<a class="btn bnt-sm btn-incre"
													href="QuantityIncDecController?action=inc&id=<%=c.getId()%>"><i
													class="fas fa-plus-square"></i></a>
												<p><%=c.getQuantity()%></p>
												<a class="btn btn-sm btn-decre"
													href="QuantityIncDecController?action=dec&id=<%=c.getId()%>"><i
													class="fas fa-minus-square"></i></a>
											</div>
										</div>
									</td>
									<td><a href="RemoveFromCartController?id=<%=c.getId()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								}
								%>
							</tbody>
						</table>

						<hr>
						<%
						if (cart_list != null) {	
						%>
						<div class="col-12 col-lg-12">
							<div class="cart-summary">
								<h1>Cart Total</h1>
								<ul class="summary-table">
									<li><span>subtotal:</span> <span>$
											${(total>0)?dcf.format(total):0} </span></li>
									<li><span>delivery:</span> <span>Free</span></li>
									<li><span> $ ${(total>0)?dcf.format(total):0}</span></li>
								</ul>
								<div class="cart-btn mt-100">
									<a href="checkout.jsp" class="btn amado-btn w-100">Checkout</a>
								</div>
							</div>
						</div>
						<%
						}
						%>
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
		data-cf-beacon='{"rayId":"7b3c87eebfd28ad9","version":"2023.3.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}'
		crossorigin="anonymous"></script>
</body>

<!-- Mirrored from preview.colorlib.com/theme/amado/cart.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Apr 2023 19:45:42 GMT -->
</html>