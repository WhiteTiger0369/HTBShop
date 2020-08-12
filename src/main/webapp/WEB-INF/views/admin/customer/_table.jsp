<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table class="table table-hover">
	<thead>
		<tr>
		<th>Mã</th>
		<th>Tên</th>
		<th>Email</th>
		<th>Trạng thái</th>
		<th>Quyền</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.fullname}</td>
			<td>${e.email}</td>
			<td>${e.activated ? 'Yes':'No'}</td>
			<td>${e.admin ? 'Adminstrator':'Khách hàng'}</td>
			<td>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
				<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Sửa</a>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
