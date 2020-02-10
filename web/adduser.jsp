<!-- adduser.jsp -->
<%@ page language="java" contentType="text/html;
    charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<fmt:setLocale value="en_US" /><!-- fixes date not displaying correctly in Eclipse browser -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>BullHorn</title>
<jsp:include page="bootstrap.jsp"></jsp:include>
</head>
<body>

<form action="AddUser" method="post">
    <input type="hidden" name="action" value="addUser">
    <center>
         <img src="images/internet-user-group-512.png" width="200" height="200"/>
      
    </center>
	<h3>Name: <input type="text" name="userName" value="" class="form-control" required="true"/></h3>
	<h3>Email: <input type="text" name="userEmail" value="" class="form-control" required="true"/></h3>
	<h3>Password: <input type="password" name="userPassword" value="" class="form-control" required="true"/></h3>
	<h3>Motto: <input type="text" name="userMotto" value="" class="form-control" required="true"/></h3>
	<!-- <h2>Join Date: <input type="text" value=""/></h2>-->
        <br/>
         <br/>
        <p>
	<input type="submit" value="Join Us" class="btn btn-primary"/>
        <input type="reset" value="Clear " class="btn btn-danger"/>
        </p>
</form>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>