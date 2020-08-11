<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="f"%>
<h2>Quên mật khẩu</h2>
<h4>${msg}</h4>
<form action="/account/forgot" method="POST">
<div class="form-group">
	<label>Tên đăng nhập</label> <input name="id" class="form-control">
</div>
<div class="form-group">
	<label>Email</label> <input name="email" class="form-control">
</div>

<div class="form-group">
	<button class="btn-login">Nhận lại mật khẩu</button>
</div>
</form>