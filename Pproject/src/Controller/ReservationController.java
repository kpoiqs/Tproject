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

@WebServlet(name = "ReservationController", urlPatterns = { "/reservation", "/book.do", "/book1.do", "/insert_book",
		"/insert_book1","/booklist_detail.admin","/mybook","/insert_book_wan","/book_delete","/adminbooklist.admin" })
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
		String action = uri.substring(lastIndex + 1);

		if (action.equals("reservation")) {

			req.setCharacterEncoding("utf-8");
			String from = req.getParameter("from");
			String to = req.getParameter("to");
			String fromdate = req.getParameter("fromDate");
			String todate = req.getParameter("toDate");

			PlanDAO dao = new PlanDAOImpl();

			List<plan> planlist = dao.selectname12(from, to);
			List<plan> planlist1 = dao.selectname12(to, from);

			if (todate != null) {
				if (!fromdate.equals(todate)) {
					List<plan> planlist5 = new ArrayList<plan>();
					List<plan> planlist6 = new ArrayList<plan>();
					int cnt = 0;
					for (int y = 0; y < planlist.size(); y++) {

						cnt = dao.checkbook(fromdate, planlist.get(y).getSno());
						if (cnt < 3) {
							planlist5.add(planlist.get(y));
						}

					}
					int cnt1 = 0;
					for (int y = 0; y < planlist1.size(); y++) {

						cnt1 = dao.checkbook(todate, planlist1.get(y).getSno());
						if (cnt1 < 3) {
							planlist6.add(planlist1.get(y));
						}

					}
					req.setAttribute("fromdate", fromdate);
					req.setAttribute("todate", todate);
					req.setAttribute("plans", planlist5);
					req.setAttribute("plan2", planlist6);

					RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
					rd.forward(req, resp);
				} else if (fromdate.equals(todate)) {

					List<plan> planlist3 = new ArrayList<plan>();
					List<plan> planlist4 = new ArrayList<plan>();
					List<plan> planlist33 = new ArrayList<plan>();
					List<plan> planlist44 = new ArrayList<plan>();
					for (int d = 0; d < planlist.size(); d++) {
						for (int i = 0; i < planlist1.size(); i++) {
							int aarvt = Integer.parseInt(planlist.get(d).getArvt().replaceAll("[^0-9]", ""));
							int bdept = Integer.parseInt(planlist1.get(i).getDept().replaceAll("[^0-9]", ""));
							int cht = bdept - aarvt;
							if (cht <= 200) {

							} else {
								int cnt4 = 0;

								cnt4 = dao.checkbook(todate, planlist1.get(i).getSno());
								if (cnt4 < 3) {								
									planlist3.add(planlist1.get(i));
									for (int j = 0; j< planlist3.size(); j++) {
										if(!planlist33.contains(planlist3.get(j))) {
											planlist33.add(planlist3.get(j));
										}
									}
								}

							}
						}
					}
					for (int d = 0; d < planlist.size(); d++) {
						for (int i = 0; i < planlist1.size(); i++) {
							int aarvt = Integer.parseInt(planlist.get(d).getArvt().replaceAll("[^0-9]", ""));
							int bdept = Integer.parseInt(planlist1.get(i).getDept().replaceAll("[^0-9]", ""));
							int cht = bdept - aarvt;
							if (cht <= 200) {

							} else {
								int cnt3 = 0;

								cnt3 = dao.checkbook(fromdate, planlist.get(d).getSno());
								if (cnt3 < 3) {
									planlist4.add(planlist.get(d));
									for (int j = 0; j< planlist4.size(); j++) {
										if(!planlist44.contains(planlist4.get(j))) {
											planlist44.add(planlist4.get(j));
										}
									}
								}

							}
						}
					}
					req.setAttribute("fromdate", fromdate);
					req.setAttribute("todate", todate);
					req.setAttribute("plans", planlist44);
					req.setAttribute("plan2", planlist33);
					RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
					rd.forward(req, resp);
				}
			} else if (todate == null) {

				List<plan> planlist7 = new ArrayList<plan>();
				int cnt2 = 0;
				for (int y = 0; y < planlist.size(); y++) {

					cnt2 = dao.checkbook(fromdate, planlist.get(y).getSno());
					if (cnt2 < 3) {
						planlist7.add(planlist.get(y));
					}

				}
				req.setAttribute("plans", planlist7);
				req.setAttribute("fromdate", fromdate);
				RequestDispatcher rd = req.getRequestDispatcher("/reservation.jsp");
				rd.forward(req, resp);
			}

		} else if (action.equals("book.do")) {
			req.setCharacterEncoding("utf-8");

			String check1 = req.getParameter("check1");
			String check2 = req.getParameter("check2");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			PlanDAO dao = new PlanDAOImpl();
			plan plan1 = dao.selectbysno(check1);
			plan plan2 = dao.selectbysno(check2);
			int a = plan1.getCost() + plan2.getCost();
			List<book> book1 = dao.seatselectall(fromdate,check1);

			req.setAttribute("pluscost", a);
			req.setAttribute("fromdate", fromdate);
			req.setAttribute("todate", todate);
			req.setAttribute("plan1", plan1);
			req.setAttribute("plan2", plan2);
			req.setAttribute("check1", check1);
			req.setAttribute("check2", check2);
			req.setAttribute("booklist", book1);
			
			RequestDispatcher rd = req.getRequestDispatcher("/seatbookr1.jsp");
			rd.forward(req, resp);
		} else if (action.equals("book1.do")) {
			req.setCharacterEncoding("utf-8");
			String check3 = req.getParameter("check3");
			String fromdate = req.getParameter("fromdate");

			PlanDAO dao = new PlanDAOImpl();
			plan plan1 = dao.selectbysno(check3);
			List<book> book1 = dao.seatselectall(fromdate,check3);
			 


			req.setAttribute("fromdate", fromdate);
			req.setAttribute("plan1", plan1);
			req.setAttribute("booklist", book1);

			RequestDispatcher rd = req.getRequestDispatcher("/seatbook.jsp");
			rd.forward(req, resp);
		} else if (action.equals("insert_book1")) {
			req.setCharacterEncoding("utf-8");
			PlanDAO dao = new PlanDAOImpl();
			String id = req.getParameter("id");
			String fromdate = req.getParameter("fromdate");
			int plan1cost = Integer.parseInt(req.getParameter("plan1cost"));
			String plan1sno = req.getParameter("plan1sno");
			String seat = req.getParameter("seat");

			book book1 = new book();
			book1.setId(id);
			book1.setDay(fromdate);
			book1.setPay(plan1cost);
			book1.setSno(plan1sno);
			book1.setSeat(seat);

			boolean result1 = dao.insert(book1);

			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		} else if (action.equals("insert_book")) {
			req.setCharacterEncoding("utf-8");
			PlanDAO dao = new PlanDAOImpl();
			String id = req.getParameter("id");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			int plan1cost = Integer.parseInt(req.getParameter("plan1cost"));
			String plan1sno = req.getParameter("plan1sno");
			int plan2cost = Integer.parseInt(req.getParameter("plan2cost"));
			String plan2sno = req.getParameter("plan2sno");
			String plan1seat = req.getParameter("plan1seat");
			String seat = req.getParameter("seat");

			book book1 = new book();
			book1.setId(id);
			book1.setDay(fromdate);
			book1.setPay(plan1cost);
			book1.setSno(plan1sno);
			book1.setSeat(plan1seat);

			book book2 = new book();
			book2.setId(id);
			book2.setDay(todate);
			book2.setPay(plan2cost);
			book2.setSno(plan2sno);
			book2.setSeat(seat);

			boolean result1 = dao.insert(book1);
			boolean result2 = dao.insert(book2);

			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}else if (action.equals("mybook")) {
			req.setCharacterEncoding("utf-8");
			PlanDAO dao = new PlanDAOImpl();
			String id = req.getParameter("accountid");
			List<book> booklist = dao.bookselectall(id);
			req.setAttribute("list", booklist);
			
			RequestDispatcher rd = req.getRequestDispatcher("/booklist.jsp");
			rd.forward(req, resp);
		}else if (action.equals("booklist_detail.admin")) {
			req.setCharacterEncoding("utf-8");
			int bno = Integer.parseInt(req.getParameter("bno"));
			PlanDAO dao = new PlanDAOImpl();
			book book1 = new book();
			
			book1 = dao.selectbybno(bno);
			
			req.setAttribute("book", book1);
			
			RequestDispatcher rd = req.getRequestDispatcher("/book4.jsp");
			rd.forward(req, resp);
		}else if (action.equals("insert_book_wan")) {
			req.setCharacterEncoding("utf-8");
			String check1 = req.getParameter("check1");
			String check2 = req.getParameter("check2");
			String fromdate = req.getParameter("fromdate");
			String todate = req.getParameter("todate");
			PlanDAO dao = new PlanDAOImpl();
			plan plan1 = dao.selectbysno(check1);
			plan plan2 = dao.selectbysno(check2);
			int plan1cost = Integer.parseInt(req.getParameter("plan1cost"));
			int plan2cost = Integer.parseInt(req.getParameter("plan2cost"));
			int a = plan1cost+plan2cost;
			List<book> book1 = dao.seatselectall(todate,check2);

			String seat = req.getParameter("seat");


			req.setAttribute("pluscost", a);
			req.setAttribute("fromdate", fromdate);
			req.setAttribute("todate", todate);
			req.setAttribute("plan1", plan1);
			req.setAttribute("plan2", plan2);
			req.setAttribute("seat1", seat);
			req.setAttribute("check1", check1);
			req.setAttribute("check2", check2);
			req.setAttribute("booklist", book1);
			
			RequestDispatcher rd = req.getRequestDispatcher("/seatbookr2.jsp");
			rd.forward(req, resp);
		}else if (action.equals("book_delete")) {
			req.setCharacterEncoding("utf-8");
			int bno = Integer.parseInt(req.getParameter("book_1bno"));
			PlanDAO dao = new PlanDAOImpl();
			
			boolean result = dao.delete(bno);
			
			
			RequestDispatcher rd = req.getRequestDispatcher("/book3.jsp");
			rd.forward(req, resp);
		}else if (action.equals("adminbooklist.admin")) {
			req.setCharacterEncoding("utf-8");
			PlanDAO dao = new PlanDAOImpl();
			List<book> booklist = dao.bookselectall();
			req.setAttribute("list", booklist);
			
			RequestDispatcher rd = req.getRequestDispatcher("/book3.jsp");
			rd.forward(req, resp);
		}					
		

	}

}
