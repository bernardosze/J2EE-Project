<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "s" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ empty param.username or empty param.password}">
		<c:redirect url="Index.jsp" >
			<c:param name="errMsg" value="Please Enter UserName and Password" />
		</c:redirect>
		<%-- <c:out value="Please enter username and password" /> --%> 
	</c:if>
     
	<c:if test="${not empty param.username and not empty param.password}">
		<s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost:3306/week10-project?serverTimezone=EST5EDT"
                       user="root" password="1234"/>
 
		<s:query dataSource="${ds}" var="selectQ">
			SELECT COUNT(*) AS kount FROM users
			WHERE username='${param.username}'
			AND password='${param.password}'
      </s:query>
 
		<c:forEach items="${selectQ.rows}" var="r">
			<c:choose>
				<c:when test="${r.kount gt 0}">
					<c:set scope="session"
							 var="loginUser"
							 value="${param.username}"/>
                   
					<c:redirect url="registerProduct.jsp"/>  
				</c:when>
				<c:otherwise>
					<c:redirect url="Index.jsp" >
						<c:param name="errMsg" value="Username/password does not match" />
					</c:redirect>
					<%-- <c:out value="Username and password does not match" /> --%>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>
</body>
</html>