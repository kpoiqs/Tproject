package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DBO.PlanDAO;
import DBO.PlanDAOImpl;

import Model.plan;



@WebServlet(name="ReservationController" , urlPatterns={"/reservation"})
public class ReservationController extends HttpServlet {

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
		
		if(action.equals("reservation")) {
			req.setCharacterEncoding("utf-8");
			String from = req.getParameter("from");
			String to = req.getParameter("to");
			System.out.println(from);
			System.out.println(to);
			
			
			PlanDAO dao = new PlanDAOImpl();
			List<plan> planlist = dao.selectname12(from,to);
			
			req.setAttribute("plans",planlist);
			
			RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
			rd.forward(req, resp);
		}
		
	}

}
