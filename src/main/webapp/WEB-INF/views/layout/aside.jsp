<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:set var="cart" value="${sessionScope['scopedTarget.cartService']}"></c:set>
<div class="panel panel-default">
	<div class="panel-heading glyphicon">Giỏ hàng</div>
	<div class="panel-body">
		<img id="cart-img" alt="gio-hang" src="/static/images/dell_inspiron_3567.jpg" class="col-sm-5">
		<ul class="col-sm-7">
			<li><b id="cart-cnt">${cart.count}</b> mặt hàng</li>
			<li><b id ="cart-amt"><f:formatNumber value="${cart.amount}" pattern="#,###.00" /></b>VND</li>
			<li>
				<a href="/cart/view">Xem giỏ hàng</a>
			</li>
		
		</ul>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">Tìm kiếm</div>
	<div class="panel-body">
		<form action="/product/list-by-keywords" method="post">
			<input value="${param.keywords}" name="keywords" class="form-control"
				placeholder="Nhập từ khóa" />
		</form>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading">DANH MỤC</div>
	<div class="list-group">
	<c:forEach var="c" items="${cates}">
		<a href="/product/list-by-category/${c.id}" class="list-group-item">${c.name}</a>
		</c:forEach>
	</div>
</div>


<div class="panel panel-default">
	<div class="panel-heading">ĐẶT BIỆT</div>
	<div class="list-group">
		<a href="/product/list-by-special/0" class="list-group-item">Hàng mới</a> 
		<a href="/product/list-by-special/1" class="list-group-item">Bán chạy</a> 
		<a href="/product/list-by-special/2"	class="list-group-item">Xem nhiều</a>
		<a href="/product/list-by-special/3" class="list-group-item">Giảm giá</a>
	</div>
</div>

<style id="cart-css">
	
</style>
