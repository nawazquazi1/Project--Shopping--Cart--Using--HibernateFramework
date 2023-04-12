<%@page import="org.*"%>
<%@page import="org.project.DAO.*"%>
<%@page import="org.project.entities.*"%>
<%@page import="java.util.*"%>

<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth == null) {
	response.sendRedirect("login.jsp");
}
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


<title>Checkout</title>

<link rel="icon" href="img/core-img/favicon.ico">

<link rel="stylesheet" href="css/core-style.css">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<script nonce="009b0a2b-f825-4583-bbf0-7dfc8c99cea6">(function(w,d){!function(bv,bw,bx,by){bv[bx]=bv[bx]||{};bv[bx].executed=[];bv.zaraz={deferred:[],listeners:[]};bv.zaraz.q=[];bv.zaraz._f=function(bz){return function(){var bA=Array.prototype.slice.call(arguments);bv.zaraz.q.push({m:bz,a:bA})}};for(const bB of["track","set","debug"])bv.zaraz[bB]=bv.zaraz._f(bB);bv.zaraz.init=()=>{var bC=bw.getElementsByTagName(by)[0],bD=bw.createElement(by),bE=bw.getElementsByTagName("title")[0];bE&&(bv[bx].t=bw.getElementsByTagName("title")[0].text);bv[bx].x=Math.random();bv[bx].w=bv.screen.width;bv[bx].h=bv.screen.height;bv[bx].j=bv.innerHeight;bv[bx].e=bv.innerWidth;bv[bx].l=bv.location.href;bv[bx].r=bw.referrer;bv[bx].k=bv.screen.colorDepth;bv[bx].n=bw.characterSet;bv[bx].o=(new Date).getTimezoneOffset();if(bv.dataLayer)for(const bI of Object.entries(Object.entries(dataLayer).reduce(((bJ,bK)=>({...bJ[1],...bK[1]})))))zaraz.set(bI[0],bI[1],{scope:"page"});bv[bx].q=[];for(;bv.zaraz.q.length;){const bL=bv.zaraz.q.shift();bv[bx].q.push(bL)}bD.defer=!0;for(const bM of[localStorage,sessionStorage])Object.keys(bM||{}).filter((bO=>bO.startsWith("_zaraz_"))).forEach((bN=>{try{bv[bx]["z_"+bN.slice(7)]=JSON.parse(bM.getItem(bN))}catch{bv[bx]["z_"+bN.slice(7)]=bM.getItem(bN)}}));bD.referrerPolicy="origin";bD.src="../../cdn-cgi/zaraz/sd0d9.js?z="+btoa(encodeURIComponent(JSON.stringify(bv[bx])));bC.parentNode.insertBefore(bD,bC)};["complete","interactive"].includes(bw.readyState)?zaraz.init():bv.addEventListener("DOMContentLoaded",zaraz.init)}(w,d,"zarazData","script");})(window,document);</script>
</head>
<body>
<%@include file="/includes/navbar.jsp"%>
		<div class="cart-table-area section-padding-100">
			<div class="container-fluid">
				<div class="row">
					<div class="col-12 col-lg-8">
						<div class="checkout_details_area mt-50 clearfix">
							<div class="cart-title">
								<h2>Checkout</h2>
							</div>
							<form action="#" method="post">
								<div class="row">
									<div class="col-md-6 mb-3">
										<input type="text" class="form-control" id="first_name"
											value="" placeholder="First Name" required>
									</div>
									<div class="col-md-6 mb-3">
										<input type="text" class="form-control" id="last_name"
											value="" placeholder="Last Name" required>
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control" id="company"
											placeholder="Company Name" value="">
									</div>
									<div class="col-12 mb-3">
										<input type="email" class="form-control" id="email"
											placeholder="Email" value="">
									</div>
									<div class="col-12 mb-3">
										<select class="w-100" id="country">
											<option value="usa">United States</option>
											<option value="uk">United Kingdom</option>
											<option value="ger">Germany</option>
											<option value="fra">France</option>
											<option value="ind">India</option>
											<option value="aus">Australia</option>
											<option value="bra">Brazil</option>
											<option value="cana">Canada</option>
										</select>
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control mb-3"
											id="street_address" placeholder="Address" value="">
									</div>
									<div class="col-12 mb-3">
										<input type="text" class="form-control" id="city"
											placeholder="Town" value="">
									</div>
									<div class="col-md-6 mb-3">
										<input type="text" class="form-control" id="zipCode"
											placeholder="Zip Code" value="">
									</div>
									<div class="col-md-6 mb-3">
										<input type="number" class="form-control" id="phone_number"
											min="0" placeholder="Phone No" value="">
									</div>
									<div class="col-12 mb-3">
										<textarea name="comment" class="form-control w-100"
											id="comment" cols="30" rows="10"
											placeholder="Leave a comment about your order"></textarea>
									</div>
									<div class="col-12">
										<div class="custom-control custom-checkbox d-block mb-2">
											<input type="checkbox" class="custom-control-input"
												id="customCheck2"> <label
												class="custom-control-label" for="customCheck2">Create
												an accout</label>
										</div>
										<div class="custom-control custom-checkbox d-block">
											<input type="checkbox" class="custom-control-input"
												id="customCheck3"> <label
												class="custom-control-label" for="customCheck3">Ship
												to a different address</label>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-12 col-lg-4">
						<div class="cart-summary">
							<h5>Cart Total</h5>
							<ul class="summary-table">
								<li><span>subtotal:</span> <span>$140.00</span></li>
								<li><span>delivery:</span> <span>Free</span></li>
								<li><span>total:</span> <span>$140.00</span></li>
							</ul>
							<div class="payment-method">

								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input" id="cod"
										checked> <label class="custom-control-label" for="cod">Cash
										on Delivery</label>
								</div>

								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input" id="paypal">
									<label class="custom-control-label" for="paypal">Paypal
										<img class="ml-15" src="img/core-img/paypal.png" alt="">
									</label>
								</div>
							</div>
							<div class="cart-btn mt-100">
								<a href="#" class="btn amado-btn w-100">Checkout</a>
							</div>
						</div>
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
		data-cf-beacon='{"rayId":"7b3c87f10ddd8ad3","version":"2023.3.0","b":1,"token":"cd0b4b3a733644fc843ef0b185f98241","si":100}'
		crossorigin="anonymous"></script>
</body>

<!-- Mirrored from preview.colorlib.com/theme/amado/checkout.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Apr 2023 19:45:42 GMT -->
</html>