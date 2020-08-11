<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>


<div class="row">
	<div class="col-sm-5 text-center">
		<img class="detail-img" src="/static/images/${p.image}">
	</div>
	<div class="col-sm-7">
		<ul class="detail-info">
			<li>${p.name}</li>
			<li>Giá: <f:formatNumber value="${p.unitPrice}" pattern="#,###" />VNĐ
			</li>
			<li>Danh mục: ${p.category.name}</li>
			<li>Giảm giá: <f:formatNumber value="${p.discount}"
					type="percent" /></li>
			<li>Lượt xem: ${p.viewCount}</li>
		</ul>
	</div>
</div>
<div class="text-justify">${p.description}</div>




<ul class="nav nav-tabs">
	<li class="active"><a data-toggle="tab" href="#tab1">Sản phẩm
			tương tự</a></li>
	<li><a data-toggle="tab" href="#tab2">Sản phẩm yêu thích</a></li>
	<li><a data-toggle="tab" href="#tab3">Sản phẩm đã xem</a></li>
</ul>

<div class="tab-content">
	<div id="tab1" class="tab-pane fade in active">
		<div>
			<c:forEach var="p" items="${list}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/images/${p.image}">
				</a>

			</c:forEach>
		</div>
	</div>
	<div id="tab2" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${favo}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/images/${p.image}">
				</a>

			</c:forEach>
		</div>
	</div>
	<div id="tab3" class="tab-pane fade">
		<div>
			<c:forEach var="p" items="${viewed}">
				<a href="/product/detail/${p.id}"> <img class="thumb-img"
					src="/static/images/${p.image}">
				</a>

			</c:forEach>
		</div>
	</div>
</div>



