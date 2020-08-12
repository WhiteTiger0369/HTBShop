<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table class="table table-hover">
	<thead>
		<tr>
		<th>Mã</th>
		<th>Tên sản phẩm</th>
		<th>Đơn giá</th>
		<th>Giảm giá</th>
		<th>Số lượng</th>
		<th>Thành tiền</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${details}">
		<tr>
			<td>${e.id}</td>
			<td>${e.product.name}</td>
			<td>${e.unitPrice}</td>
			<td>${e.discount}</td>
			<td>${e.quantity}</td>
			<td>${e.unitPrice* e.quantity * (1-e.discount)}</td>
			<td>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
				<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Sửa</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
