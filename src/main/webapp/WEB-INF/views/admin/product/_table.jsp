<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table class="table table-hover">
	<thead>
		<tr>
		<th>Mã</th>
		<th>Tên</th>
		<th>Giá</th>
		<th>Giảm giá</th>
		<th>Số lượng</th>
		<th>Ngày nhập</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.name}</td>
			<td>${e.unitPrice}</td>
			<td>${e.discount}</td>
			<td>${e.quantity}</td>
			<td>${e.productDate}</td>
			<td>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
				<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Sửa</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
