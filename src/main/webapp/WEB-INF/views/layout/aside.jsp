<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<div class="panel panel-default">
	<div class="panel-heading">Giỏ hàng</div>
	<div class="panel-body">
		<img alt="gio-hang" src="/static/images/dell_inspiron_3567.jpg" class="col-sm-5">
		<ul class="col-sm-7">
			<li>10 mặt hàng</li>
			<li>150 ngàn</li>
			<li>
				<a href="">Xem giỏ hàng</a>
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
		<a href="#" class="list-group-item">Hàng mới</a> 
		<a href="#" class="list-group-item">Bán chạy</a> 
		<a href="#"	class="list-group-item">Yêu thích</a>
		<a href="#" class="list-group-item">Giảm giá</a>
	</div>
</div>
