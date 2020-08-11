<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<h2>Quên mật khẩu</h2>
<h4>${msg}</h4>
<form action="/account/change" method="POST">
<div class="form-group">
	<label>Tên đăng nhập</label> <input name="id" class="form-control">
</div>
<div class="form-group">
	<label>Mật khẩu hiện tại</label> <input name="pw" class="form-control">
</div>
<div class="form-group">
	<label>Mật khẩu mới</label> <input name="pw1" class="form-control">
</div>
<div class="form-group">
	<label>Nhập lại mật khẩu mới</label> <input name="pw2" class="form-control">
</div>

<div class="form-group">
	<button class="btn-login">Xong</button>
</div>
</form>