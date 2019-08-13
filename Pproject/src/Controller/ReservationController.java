package Controller;

import java.io.IOException;
import java.util.ArrayList;
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
import Model.book;
import Model.plan;



@WebServlet(name="ReservationController" , urlPatterns={"/reservation","/book.do","/book1.do","/insert_book","/insert_book1"})
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
			String fromdate = req.getParameter("fromDate");
			String todate = req.getParameter("toDate");
			
			PlanDAO dao = new PlanDAOImpl();
			
			
			List<plan> planlist = dao.selectname12(from,to);
			List<plan> planlist1 = dao.selectname12(to,from);
			
			List<plan> planlist5 = dao.checkbook(fromdate, from, to);
			int a = 0;
			int b = 0;
			for(int ioi = 0;ioi<planlist5.size();ioi++) {
				for(int oio = 0;oio<planlist.size();oio++) {
					if(planlist.get(oio).getSno().equals(planlist5.get(ioi).getSno())) {
						a = a+1;
					}else if(!planlist.get(oio).getSno().equals(planlist5.get(ioi).getSno())) {
						b = b+1;
					}
				}
			}
			
			if(todate != null ) {
				if(!fromdate.equals(todate)) {
					
				
			
				
			req.setAttribute("fromdate", fromdate);
			req.setAttribute("todate", todate);
			req.setAttribute("plans",planlist);
			req.setAttribute("plan2", planlist1);

			RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
			rd.forward(req, resp);
				}
			else if(fromdate.equals(todate)) {
			
				List<plan> planlist3 = new ArrayList<plan>();
				List<plan> planlist4 = new ArrayList<plan>();
				for(plan a:planlist) {
					for(int i = 0;i<planlist1.size();i++) {
						int aarvt = Integer.parseInt(a.getArvt().replaceAll("[^0-9]","" ));
						int bdept = Integer.parseInt(planlist1.get(i).getDept().replaceAll("[^0-9]","" ));
						int cht = bdept-aarvt;
						if(cht<=0) {
							
						}else {
						 
						 planlist3.add(planlist1.get(i));
						}
					}
				}for(int d = 0;d<planlist.size();d++) {
					for(int i = 0;i<planlist1.size();i++) {
						int aarvt = Integer.parseInt(planlist.get(d).getArvt().replaceAll("[^0-9]","" ));
						int bdept = Integer.parseInt(planlist1.get(i).getDept().replaceAll("[^0-9]","" ));
						int cht = bdept-aarvt;
						if(cht<=0) {
							
						}else {
						 
						 planlist4.add(planlist.get(d));
						}
					}
				}
				req.setAttribute("fromdate", fromdate);
				req.setAttribute("todate", todate);
				req.setAttribute("plans",planlist4);
				req.setAttribute("plan2", planlist3);
				RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
				rd.forward(req, resp);
			}
			}else if(todate == null) {
				
				req.setAttribute("plans",planlist);
				req.setAttribute("fromdate", fromdate);
				RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
				rd.forward(req, resp);
			}
			
			
			
			
			}else if(action.equals("book.do")) {
				req.setCharacterEncoding("utf-8");
				
				String check1 = req.getParameter("check1");
				String check2 = req.getParameter("check2");
				String fromdate = req.getParameter("fromdate");
				String todate = req.getParameter("todate");
				PlanDAO dao = new PlanDAOImpl();
				plan plan1 = dao.selectbysno(check1);
				plan plan2 = dao.selectbysno(check2);
				int a = plan1.getCost()+plan2.getCost();
				
				req.setAttribute("pluscost", a);
				req.setAttribute("fromdate", fromdate);
				req.setAttribute("todate", todate);
				req.setAttribute("plan1", plan1);
				req.setAttribute("plan2", plan2);
				RequestDispatcher rd = req.getRequestDispatcher("/book.jsp");
				rd.forward(req, resp);
			}else if(action.equals("book1.do")) {
				req.setCharacterEncoding("utf-8");
				String check3 = req.getParameter("check3");
				String fromdate = req.getParameter("fromdate");
				
				PlanDAO dao = new PlanDAOImpl();
				plan plan1 = dao.selectbysno(check3);
				req.setAttribute("fromdate", fromdate);
				req.setAttribute("plan1", plan1);
				
				RequestDispatcher rd = req.getRequestDispatcher("/book1.jsp");
				rd.forward(req, resp);
			}else if(action.equals("insert_book1")) {
				req.setCharacterEncoding("utf-8");
				PlanDAO dao = new PlanDAOImpl();
				String id = req.getParameter("id");
				String fromdate = req.getParameter("fromdate");
				int plan1cost = Integer.parseInt(req.getParameter("plan1cost"));
				String plan1sno = req.getParameter("plan1sno");
				
				book book1 = new book();
				book1.setId(id);
				book1.setDay(fromdate);
				book1.setPay(plan1cost);
				book1.setSno(plan1sno);
				
				
				boolean result1 = dao.insert(book1);
				
				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}else if(action.equals("insert_book")) {
				req.setCharacterEncoding("utf-8");
				PlanDAO dao = new PlanDAOImpl();
				String id = req.getParameter("id");
				String fromdate = req.getParameter("fromdate");
				String todate = req.getParameter("todate");
				int plan1cost = Integer.parseInt(req.getParameter("plan1cost"));
				String plan1sno = req.getParameter("plan1sno");
				int plan2cost = Integer.parseInt(req.getParameter("plan2cost"));
				String plan2sno = req.getParameter("plan2sno");
				
				book book1 = new book();
				book1.setId(id);
				book1.setDay(fromdate);
				book1.setPay(plan1cost);
				book1.setSno(plan1sno);
				
				book book2 = new book();
				book2.setId(id);
				book2.setDay(todate);
				book2.setPay(plan2cost);
				book2.setSno(plan2sno);
				
				boolean result1 = dao.insert(book1);
				boolean result2 = dao.insert(book2);
				
				RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
				rd.forward(req, resp);
			}
		
		}
		
	

}
