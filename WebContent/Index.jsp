<!DOCTYPE html>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login Form</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="style.css">
</head>
<body>
<c:if test="${not empty param.errMsg}">
	<div class="alert alert-warning alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<c:out value="${param.errMsg}" />
	</div>
</c:if>
<h2>ABC Insurance</h2>

<div class="login-form">
	<form action="loginValidate.jsp" method="post">
		<div class="avatar">
			<img src="/examples/images/avatar.png" alt="Avatar">
		</div>
		<h2 class="text-center">Member Login</h2>   
		<div class="form-group">
			<input type="text" class="form-control" name="username" placeholder="Username" required="required">
		</div>
		<div class="form-group">
			<input type="password" class="form-control" name="password" placeholder="Password" required="required">
		</div>        
		<div class="form-group">
			<button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
		</div>
		<div class="clearfix">
			<label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
			<a href="#" class="pull-right">Forgot Password?</a>
		</div>
	</form>
	<p class="text-center small">Don't have an account? <a href="register.jsp">Sign up here!</a></p>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
</body>
</html>                            