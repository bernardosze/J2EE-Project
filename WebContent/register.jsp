<!DOCTYPE html>
<%@ page import = "java.sql.*" %> 
<%@ page import = "java.io.*" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<html lang="en">
<head>
<sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" 
url="jdbc:mysql://localhost:3306/project2?serverTimezone=EST5EDT" user="root" password="1234"></sql:setDataSource>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login Form</title>
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
<h2>ABC Insurance</h2>
<div class="login-form">

    <form method="post">
		<div class="avatar">
			<img src="/examples/images/avatar.png" alt="Avatar">
		</div>
        <h2 class="text-center">New User Registration</h2>  
        
         <div class="form-group">
          First Name:<input type="text" class="form-control" name="firstName" placeholder="First Name" required="required">
        </div>
        
        
         <div class="form-group">
        	Last Name:<input type="text" class="form-control" name="lastName" placeholder="Last Name" required="required">
        </div>
        
         
        <div class="form-group">
        Username:	<input type="text" class="form-control" name="username" placeholder="Username" required="required">
        </div>
		
		<div class="form-group">
         Password:   <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>  
        
        <div class="form-group">
           Email: <input type="text" class="form-control" name="email" placeholder="Email" required="required">
        </div>  
        
        <div class="form-group">
           Cell No: <input type="text" class="form-control" name="cellNo" placeholder="Cell No" required="required">
        </div>  
        
        <div class="form-group">
          Address:  <input type="text" class="form-control" name="address" placeholder="Address" required="required">
        </div>        
        
        <div class="form-group">
           <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
        </div>
	
    </form>
    
    
    
   
  
</div>
 <c:if test="${pageContext.request.method=='POST'}">
 <c:catch var="exception">

<sql:update dataSource="${dataSource}" var="updatedTable">
INSERT INTO users (firstName, lastName,username, password, email, cellNo, address) VALUES (?, ?, ?, ?, ?, ?, ?);

<sql:param value="${param.firstName}" />
<sql:param value="${param.lastName}" />
<sql:param value="${param.username}" />
<sql:param value="${param.password}" />
<sql:param value="${param.email}" />
<sql:param value="${param.cellNo}" />
<sql:param value="${param.address}" />
</sql:update>
<c:if test="${updatedTable>=1}">

<font size="5" color='green'> Congratulations ! Data inserted
successfully.<br>
<a href="registerProduct.jsp">Click here to register your products</a>

</font>
</c:if>
</c:catch>
<c:if test="${exception!=null}">
<c:out value="Unable to insert data in database." />
</c:if>
</c:if>


</body>
</html>                            