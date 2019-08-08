package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBO.AccountDAO;
import DBO.AccountDAOImpl;
import Model.Account;



@WebServlet(name="LoginController" , urlPatterns={"/login" , "/login_input" , "/logout" , "/join" , "/checkid" ,"/find"})
public class LoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		process(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		process(req, resp);
	}

	private void process(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uri = req.getRequestURI();
		int lastIndex = uri.lastIndexOf("/");
		String action = uri.substring(lastIndex+1);
		
		if(action.equals("login_input")) {
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.forward(req, resp);
			}
		else if(action.equals("login")){
			req.setCharacterEncoding("utf-8");
			
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.selectById(id, password);
			
				if(account != null) {
					HttpSession session = req.getSession();
					session.setAttribute("account", account);
					RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
					rd.forward(req, resp);
				}
				else{
					req.setAttribute("message", "discord");
					RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
					rd.forward(req, resp);
				}
			}
			else if(action.equals("logout")) {
			HttpSession session = req.getSession();
			session.removeAttribute("account");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
			}
			else if(action.equals("join")) {
			AccountDAO dao = new AccountDAOImpl();
			Account account = new Account();
			
			account.setId(req.getParameter("inputid"));
			account.setPwd(req.getParameter("inputpassword"));
			account.setEmail(req.getParameter("inputemail"));
			
			dao.insert(account);
			
			resp.sendRedirect("/Pproject/index.jsp");		
			}
			else if(action.equals("find")) {
			String email = req.getParameter("email");
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.selectByEmail(email);
			System.out.println(account);
			req.setAttribute("account", account);
			RequestDispatcher rd = req.getRequestDispatcher("/find.jsp");
			rd.forward(req, resp);
		}
		
	}

}
