<!-- home.jsp -->

<%@page import="model.Bhuser"%>
<%@page import="model.Bhpost"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html;
         charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Bullhorn</title>
        <jsp:include page="bootstrap.jsp"></jsp:include>
        </head>
        <body>
        <jsp:include page="navbar.jsp"></jsp:include>
        <%
            Bhuser user = (Bhuser) session.getAttribute("user");
        %>
        <h1>Welcome <%= user.getUsername()%></h1>
        <form role="form" action="PostServ" method="post" onsubmit="return validate(this);">
            <div class="form-group">  
                <label for="post">Create New Post (141 char):</label>
                <textarea name= "posttext" id="posttext" class="form-control" rows="2" placeholder= "Express yourself!" maxlength="141"></textarea>
                <div id="textarea_feedback"></div>
            </div> 
            <div class = "form-group"> 
                <input type="submit" value="Submit" id="submit"/>
                <input type="reset" value="Clear"/>
            </div>  
        </form>     

        <h1>Posts </h1>

        <%
            List<Bhpost> posts = user.getBhposts();
            for (Bhpost post : posts) {
                out.println("<img style=\"border:thin solid white;border-radius:10px;\" width=\"50\" height=\"50\" src=\"https://www.gravatar.com/avatar/df5b3f692d18f40c0a9b58d3899f7f3b?s=120\"><p>"+post.getPosttext() + " " + post.getPostdate()+"   <a href=\"\">Like</a> |<a href=\"\">Dislike</a></p>");
            }
        %>
        <jsp:include page="footer.jsp"></jsp:include>
        <script>
            $(document).ready(function () {
                var text_max = 141;
                $('#textarea_feedback').html(text_max + ' characters remaining');

                $('#posttext').keyup(function () {
                    var text_length = $('#posttext').val().length;
                    var text_remaining = text_max - text_length;

                    $('#textarea_feedback').html(text_remaining + ' characters remaining');
                });
            });

            function validate(form) {
                valid = true;
                if ($('#posttext').val().length == 0) {
                    alert("You may not submit an empty post.");
                    valid = false;
                }
                return valid;
            }
        </script>
    </body>
</html>