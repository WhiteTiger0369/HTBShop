<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<table class="table">
	<thead>
		<tr>
			<th>Id</th>
			<th>Ten</th>
			<th>Gia</th>
			<th>Giam gia</th>
			<th>So luong</th>
			<th>Thanh tien</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="p"
		items="${sessionScope['scopedTarget.cartService'].items}">
		<tr>
			<td>${p.id}</td>
			<td>${p.name}</td>
			<td><f:formatNumber value="${p.unitPrice}" pattern="#,###.00" /></td>
			<td>${p.discount}</td>
			<td>${p.quantity}</td>
			<td class="amt"><f:formatNumber value="${p.quantity * p.unitPrice * (1-p.discount)}" pattern="#,###.00" /></td>
		</tr>
	</c:forEach>
</tbody>
</table>

<h2>Thanh toán</h2>
<h4>${msg}</h4>
<form:form action="/order/checkout" modelAttribute="order" >
<div class="form-group">
	<label>Khách hàng</label> <form:input path="customer.id" class="form-control"/>
</div>
<div class="form-group">
	<label>Ngày đặt hàng</label> <form:input path="orderDate" class="form-control"/>
</div>
<div class="form-group">
	<label>Địa chỉ</label> <form:input path="address" class="form-control"/>
</div>
<div class="form-group">
	<label>Tổng tiền</label> <form:input path="amount" class="form-control"/>
</div>
<div class="form-group">
	<label>Ghi chú</label> 
	<form:textarea path="description" rows="3" class="form-control"/>
</div>

<div class="form-group">
	<button class="btn btn-default">Thanh toán</button>
</div>
</form:form>