<!-- home.jsp -->
<%@ page language="java" contentType="text/html;
    charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<jsp:include page="bootstrap.jsp"></jsp:include>
  </head>
  <body>
      <center>
          
          <img src="images/User_icon_1.svg_1.png" width="200" height="200"/>
      </center>

    <div class="container">
        <h1>Login</h1>
      <form class="form-signin" method="post" action="LoginServlet">
        <h2 class="form-signin-heading">${message}</h2>
      <p>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="email" id="inputEmail" class="form-control" 
               placeholder="Email address" required autofocus></p>
      <p>
        <input type="hidden" name="action" id="action" value="login"/>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="password"  type="password" id="inputPassword" 
        class="form-control" placeholder="Password" required>
      </p>
      <p>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </p>
      </form>
    <a href="adduser.jsp">Join</a>
    </div> <!-- /container -->

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>