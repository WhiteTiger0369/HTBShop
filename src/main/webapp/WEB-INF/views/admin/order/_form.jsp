<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="panel panel-default">
	<div class="panel-body">
		<form:form action="${base}/index" modelAttribute="entity">
			<div class="form-group">
				<label>Mã đơn hàng</label>
				<form:input path="id" class="form-control" readonly="true"/>
			</div>
			<div class="form-group">
				<label>Tên khách hàng</label>
				<form:input path="customer.id" class="form-control" />
			</div>
			<div class="form-group">
				<label>Ngày đặt hàng</label>
				<form:input path="orderDate" id="datepicker" class="form-control" />
			</div>
			<div class="form-group">
				<label>Địa chỉ</label>
				<form:input path="address" class="form-control" />
			</div>
			<div class="form-group">
				<label>Tổng số tiền</label>
				<form:input path="amount" class="form-control" />
			</div>
			<div class="form-group">
				<label>Ghi chú</label>
				<form:textarea path="description" class="form-control"/>
			</div>
			<div class="form-group">
				<button class="btn btn-primary" formaction="${base}/create">Thêm</button>
				<button class="btn btn-warning" formaction="${base}/update">Sửa</button>
				<button class="btn btn-danger" formaction="${base}/delete">Xóa</button>
				<a class="btn btn-default" href="${base}/index">Khôi phục</a>
			</div>
		</form:form>
		<c:if test="${!empty details}">
			<jsp:include page="_details.jsp"></jsp:include>
		</c:if>

	</div>
</div>
<script type="text/javascript">

	//datepiker
	$(function() {
		$("#datepicker").datepicker();
	});
</script>

