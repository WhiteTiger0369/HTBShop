<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<h2 class="alert alert-warning">Quản lí danh mục</h2>
<h4 class="table table-success">${msg}${param.msg}</h4>
<c:set var="base" value="/admin/order" scope="request" />


<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#tab1">Chỉnh sửa</a></li>
	<li><a data-toggle="tab" href="#tab2">Danh sách</a></li>
</ul>

<div class="tab-content">
	<div id="tab1" class="tab-pane fade in active">
		<jsp:include page="_form.jsp"></jsp:include>
	</div>
	<div id="tab2" class="tab-pane fade">
		<jsp:include page="_table.jsp"></jsp:include>
	</div>
</div>
