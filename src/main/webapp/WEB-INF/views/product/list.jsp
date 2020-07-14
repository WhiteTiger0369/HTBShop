<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>

<c:forEach var="p" items="${list}">
	<div class="col-sm-4">
		<div class="thumbnail">
			<a href="/product/detail/${p.id}"> 
			<img class="product" src="/static/images/${p.image}">
			</a>
			<div class="caption" >
				<p>${p.name}</p>
				<div class="pull-right" data-id="${p.id}">
					<button class="btn btn-sm btn-danger">
						<i class="glyphicon glyphicon-shopping-cart"></i>
					</button>
					<button class="btn btn-sm btn-warning btn-star">
						<i class="glyphicon glyphicon-star"></i>
					</button>
				</div>
				<p><f:formatNumber value="${p.unitPrice}" pattern="#,###" />VNĐ</p>
			</div>

		</div>
	</div>
</c:forEach>