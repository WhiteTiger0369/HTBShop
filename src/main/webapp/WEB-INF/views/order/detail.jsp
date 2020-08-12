<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<h2>Thông tin đơn hàng</h2>
<form:form action="/order/detail" modelAttribute="order" >
<div class="form-group">
	<label>Mã đơn hàng</label> <form:input path="id" class="form-control" readonly="true"/>
</div>
<div class="form-group">
	<label>Khách hàng</label> <form:input path="customer.id" class="form-control" readonly="true"/>
</div>
<div class="form-group">
	<label>Ngày đặt hàng</label> <form:input path="orderDate" class="form-control" readonly="true"/>
</div>
<div class="form-group">
	<label>Địa chỉ</label> <form:input path="address" class="form-control" readonly="true"/>
</div>
<div class="form-group">
	<label>Tổng tiền</label> <form:input path="amount" class="form-control" readonly="true"/>
</div>
<div class="form-group">
	<label>Ghi chú</label> 
	<form:textarea path="description" rows="3" class="form-control" readonly="true"/>
</div>
</form:form>

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
	<c:forEach var="d"
		items="${details}">
		<tr>
			<td>${d.product.id}</td>
			<td>${d.product.name}</td>
			<td><f:formatNumber value="${d.unitPrice}" pattern="#,###.00" /></td>
			<td>${d.discount}</td>
			<td>${d.quantity}</td>
			<td class="amt"><f:formatNumber value="${d.quantity * d.unitPrice * (1-d.discount)}" pattern="#,###.00" /></td>
		</tr>
	</c:forEach>
</tbody>
</table>