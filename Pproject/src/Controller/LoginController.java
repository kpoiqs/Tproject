package Controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBO.AccountDAO;
import DBO.AccountDAOImpl;
import DBO.PlanDAO;
import DBO.PlanDAOImpl;
import Model.Account;
import Model.book;




 
@WebServlet(name="LoginController" , urlPatterns={"/login" , "/login_input" , "/logout" , "/join" , "/idcheck" , "/find" , "/emailcheck" , "/findpwd" , "/detail" , "/Withdrawal" , "/delete"})
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
		
		if(action.equals("login")){
			
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			
			
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.selectById(id, password);
			
				if(account != null&&!account.getId().equals("kpoiqq")) {
					HttpSession session = req.getSession();
					session.setAttribute("account", account);
					RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
					rd.forward(req, resp);
				}else if (account == null){
					req.setAttribute("message", "discord");
					RequestDispatcher rd = req.getRequestDispatcher("/checker.jsp");
					rd.forward(req, resp);
				}
				else if (account.getId().equals("kpoiqq")) {
					HttpSession session = req.getSession();
					session.setAttribute("account", account);
					req.setCharacterEncoding("utf-8");
					PlanDAO dao1 = new PlanDAOImpl();
					List<book> booklist = dao1.bookselectall();
					req.setAttribute("list", booklist);
					RequestDispatcher rd = req.getRequestDispatcher("/book3.jsp");
					rd.forward(req, resp);
				}
				
				
		}else if(action.equals("logout")) {
			
			HttpSession session = req.getSession();
			session.removeAttribute("account");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
			
		}else if(action.equals("join")) {
			
			AccountDAO dao = new AccountDAOImpl();
			Account account = new Account();
			
			account.setId(req.getParameter("inputid"));
			account.setPwd(req.getParameter("inputpassword"));
			account.setEmail(req.getParameter("inputemail"));
			
			dao.insert(account);
			
			resp.sendRedirect("/Pproject/signupcheck.jsp");		
		
		}else if(action.equals("find")) {
			
			String email = req.getParameter("email");
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.selectByEmail(email);
			req.setAttribute("account", account);
			RequestDispatcher rd = req.getRequestDispatcher("/find.jsp");
			rd.forward(req, resp);
		
		}else if(action.equals("idcheck")) {
		
			AccountDAO dao = new AccountDAOImpl();
			int count = dao.checkById(req.getParameter("inputid"));
			
			req.setAttribute("count", count);
			
			if(count==0) {
				req.setAttribute("idcheck", "The ID is available for use.");
			}else {
				req.setAttribute("idcheck", "This ID cannot be used.");
				
			}
			
			RequestDispatcher rd = req.getRequestDispatcher("/checker.jsp");
			rd.forward(req, resp);	
			
		}else if(action.equals("emailcheck")) {
					
			AccountDAO dao = new AccountDAOImpl();
			int count = dao.checkByemail(req.getParameter("inputemail"));
			req.setAttribute("count", count);
			if(count==0) {
				req.setAttribute("email", "This is an email you can use.");
			}else {
				req.setAttribute("email", "This email is not available.");				
			}

			RequestDispatcher rd = req.getRequestDispatcher("/checker.jsp");
			rd.forward(req, resp);	
		
		}else if (action.equals("login_input")) {
			RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
			rd.forward(req, resp);	
			
		}else if (action.equals("findpwd")) {
			String id = req.getParameter("id");
			String email = req.getParameter("email");
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.findByPwd(id, email);
			req.setAttribute("account", account);
			RequestDispatcher rd = req.getRequestDispatcher("/findpwd.jsp");
			rd.forward(req, resp);
		
		}else if (action.equals("detail")) {
			Account account = new Account();
			
			account.setPwd(req.getParameter("inputpassword"));
			account.setEmail(req.getParameter("inputemail"));
			account.setId(req.getParameter("id"));
			AccountDAO dao = new AccountDAOImpl();
			boolean result = dao.update(account);
			HttpSession session = req.getSession();
			session.setAttribute("account", account);
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);	
		}else if(action.equals("Withdrawal")) {
			String id = req.getParameter("checkid");
			String password = req.getParameter("checkpassword");
			
			AccountDAO dao = new AccountDAOImpl();
			Account account = dao.selectById(id, password);
			
				if(account != null) {
					RequestDispatcher rd = req.getRequestDispatcher("/Withdrawal.jsp");
					rd.forward(req, resp);
				}
				else{
					req.setAttribute("message", "discord");
					RequestDispatcher rd = req.getRequestDispatcher("/Withdrawalcheck.jsp");
					rd.forward(req, resp);
				}
				
		}else if(action.equals("delete")) {
			String id = req.getParameter("id");
			AccountDAO dao = new AccountDAOImpl();
			boolean result = dao.deleteByAccount(id);
			req.setAttribute("id", id);
			
			HttpSession session = req.getSession();
			session.removeAttribute("account");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}
	

	}
}
