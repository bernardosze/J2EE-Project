<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, java.util.*, java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	body {
		color: #fff;
		background: #d47677;
	}
	.form-control {
        min-height: 41px;
		background: #fff;
		box-shadow: none !important;
		border-color: #e3e3e3;
	}
	.form-control:focus {
		border-color: #70c5c0;
	}
    .form-control, .btn {        
        border-radius: 2px;
    }
	.login-form {
		width: 350px;
		margin: 0 auto;
		padding: 100px 0 30px;		
	}
	.login-form form {
		color: #7a7a7a;
		border-radius: 2px;
    	margin-bottom: 15px;
        font-size: 13px;
        background: #ececec;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;	
        position: relative;	
    }
	.login-form h2 {
		font-size: 22px;
        margin: 35px 0 25px;
    }
	.login-form .avatar {
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -50px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		background: #70c5c0;
		padding: 15px;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.login-form .avatar img {
		width: 100%;
	}	
    .login-form input[type="checkbox"] {
        margin-top: 2px;
    }
    .login-form .btn {        
        font-size: 16px;
        font-weight: bold;
		background: #70c5c0;
		border: none;
		margin-bottom: 20px;
    }
	.login-form .btn:hover, .login-form .btn:focus {
		background: #50b8b3;
        outline: none !important;
	}    
	.login-form a {
		color: #fff;
		text-decoration: underline;
	}
	.login-form a:hover {
		text-decoration: none;
	}
	.login-form form a {
		color: #7a7a7a;
		text-decoration: none;
	}
	.login-form form a:hover {
		text-decoration: underline;
	}
</style>
</head>
<body>
<div class="login-form">
 	<form name="AddCollection" method="get">
		<div class="form-group">
			<sql:setDataSource var="pigmy"  driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost:3306/week10-project?serverTimezone=EST5EDT"
						user="root"  password="1234"/>
				Enter username to register products:  <input type="text"class="form-control" name="username" size="10"/><br/><br/>
		</div>
     
		<c:if test="${not empty param.username}">
			<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
						url="jdbc:mysql://localhost:3306/week10-project?serverTimezone=EST5EDT"
						user="root" password="1234"/>
 
			<sql:query dataSource="${ds}" var="getUser">
					SELECT id FROM users
					WHERE username='${param.username}'
			</sql:query>
			
			<c:forEach var="row" items="${getUser.rows}">
 				<c:set var="getUserId" value="${row.id}"/>
         </c:forEach>
 
			<sql:query dataSource="${pigmy}" var="result">
					SELECT * FROM products;
			</sql:query>
			Select you product:
			<select id="ClientDropdown" name="ClientDropdown" class="form-control" width="300"  style="width: 300px">
				<c:forEach var="row" items="${result.rows}">
            	<option><c:out value="${row.name}"/></option>
            </c:forEach>
			</select><br/><br/>

			<div class="form-group">
				Serial No:
				<input type="text"class="form-control" name="serialNo" size="10"/><br/><br/>
			</div>
   
			<div class="form-group">
				Purchase Date:
				<input type="date" class="form-control" name="purchaseDate" size="10" /><br/><br/>
			</div>
		</c:if>
		
      <div class="form-group">
			<button type="submit" class="btn btn-primary btn-lg btn-block">Submit</button>
		</div>
      <!-- <input type="submit" value="Submit" class="btn btn-primary btn-lg btn-block" name="Submit" /> -->
      
	</form>
</div>    
<c:if test="${pageContext.request.method == 'POST'}">
	<c:catch var="exception">

		<sql:update dataSource="${dataSource}" var="updatedTable">
			INSERT INTO product-registration  VALUES (?, ?, ?, ?);
			<sql:param value="${getUserId}" />
			<sql:param value="${param.clientDropdown}" />
			<sql:param value="${param.serialNo}" />
			<sql:param value="${param.purchaseDate}" />
		</sql:update>
		<c:if test="${updatedTable>=1}">
			<font size="5" color='green'> Congratulations! Data inserted successfully.</font>
		</c:if>
	</c:catch>
	<c:if test="${exception!=null}">
		<c:out value="Unable to insert data in database."/>
	</c:if>
</c:if>
  
</body>
</html>