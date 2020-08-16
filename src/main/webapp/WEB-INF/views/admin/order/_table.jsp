<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<table class="table table-hover">
	<thead>
		<tr>
		<th>Mã</th>
		<th>Khách hàng</th>
		<th>Ngày đặt</th>
		<th>Địa chỉ</th>
		<th>Tổng tiền</th>
		</tr>
	</thead>
	<tbody id = "tbody">
	<%-- <c:forEach var="e" items="${list}">
		<tr>
			<td>${e.id}</td>
			<td>${e.customer.id}</td>
			<td>${e.orderDate}</td>
			<td>${e.address}</td>
			<td>${e.amount}</td>
			<td>
				<a class="btn btn-sm btn-danger" href="${base}/delete/${e.id}">Xóa</a>
				<a class="btn btn-sm btn-info" href="${base}/edit/${e.id}">Sửa</a>
			</td>
		</tr>
	</c:forEach> --%>
	</tbody>
</table>
<ul class="pager">
  <li><a href="#">Trang đầu</a></li>
  <li><a href="#">Trang trước</a></li>
  <li><a href="#"><span id="page-info"></span></a></li>
  <li><a href="#">Trang sau</a></li>
  <li><a href="#">Trang cuối</a></li>
</ul>

<script type="text/javascript">
$(function() {
	var pageNo = 0;
	var pageCount = 0;
	var pageSize = 10;
	$.ajax({
		url:'/pager/order/page-count',
		success: function(response){
			pageCount =response;
			$(".pager a:eq(0)").click();
		}
	});
	$(".pager a:eq(0)").click(function() {
		pageNo = 0;
		$.ajax({
			url:'/pager/order/page/' + pageNo,
			success: handle
		})
		return false;
		
	});
	
	$(".pager a:eq(1)").click(function() {
		if(pageNo > 0){
			pageNo--;
			$.ajax({
				url:'/pager/order/page/' + pageNo,
				success: handle
			})
		}
		
		return false;
	});

	$(".pager a:eq(3)").click(function() {
		if(pageNo < pageCount-1){
			pageNo++;
			$.ajax({
				url:'/pager/order/page/' + pageNo,
				success: handle
			})
		}
	
		return false;
	});
	$(".pager a:eq(4)").click(function() {
		pageNo = pageCount-1;
		$.ajax({
			url:'/pager/order/page/' + pageNo,
			success: handle
		})
		return false;
	});
	function handle(response){
			$("#tbody").html("")
			$(response).each(function(index, order){
				var tr = $("<tr/>");
				var td = $("<td/>").html(order.id).appendTo(tr);
				var td = $("<td/>").html(order.customer.id).appendTo(tr);
				var td = $("<td/>").html(order.orderDate).appendTo(tr);
				var td = $("<td/>").html(order.address).appendTo(tr);
				var td = $("<td/>").html(order.amount).appendTo(tr);
				var s = `<td class="text-center">
					<a class="btn btn-sm btn-danger" href="/admin/order/delete/`+order.id+`">Xóa</a>
					<a class="btn btn-sm btn-info" href="/admin/order/edit/`+order.id+`">Sửa</a>
				</td>`;
				$(s).appendTo(tr);
				tr.appendTo("tbody")
				$("#page-info").html((pageNo+1)+'/'+pageCount);
			});
	}
});
</script>
