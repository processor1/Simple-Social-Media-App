//LoginServlet.java
package controller;
/*
 * the login servlet processes login.jsp. The servlet has one job
 * which is to validate the user and add them to the session so
 * that user will be available to all pages. If the user is not valid
 * then the login servlet will redirect back to the login page.
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import service.DbUser;
import model.Bhuser;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//this page does not require user to be logged in
		String useremail = request.getParameter("email");
		String userpassword = request.getParameter("password");
		String action = request.getParameter("action");
		//String remember = request.getParameter("remember");
		String nextURL = "/error.jsp";
		
		HttpSession session = request.getSession();
		
	
		if (action.equals("logout")){
			session.invalidate();
			nextURL = "/login.jsp";
			
		}else{
			if (DbUser.isValidUser(useremail,userpassword)){
				Bhuser user = DbUser.getUserByEmail(useremail);
				session.setAttribute("user", user);
				int gravatarImageWidth = 30;
				String gravatarURL = 
					DbUser.getGravatarURL(useremail, gravatarImageWidth);
				session.setAttribute("gravatarURL", gravatarURL);
				nextURL = "/home.jsp";
			}else{
				nextURL = "/login.jsp";
			}
		}
		//redirect to next page as indicated by the value of the nextURL variable
		getServletContext().getRequestDispatcher(nextURL).forward(request,response);
	}

}
//End of LoginServlet.java
