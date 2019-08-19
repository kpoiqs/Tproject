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
		"/insert_book1","/book3_delete" })
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
					for (plan a : planlist) {
						for (int i = 0; i < planlist1.size(); i++) {
							int aarvt = Integer.parseInt(a.getArvt().replaceAll("[^0-9]", ""));
							int bdept = Integer.parseInt(planlist1.get(i).getDept().replaceAll("[^0-9]", ""));
							int cht = bdept - aarvt;
							if (cht <= 0) {

							} else {
								int cnt4 = 0;

								cnt4 = dao.checkbook(todate, planlist1.get(i).getSno());
								if (cnt4 < 3) {
									planlist3.add(planlist1.get(i));
								}

							}
						}
					}
					for (int d = 0; d < planlist.size(); d++) {
						for (int i = 0; i < planlist1.size(); i++) {
							int aarvt = Integer.parseInt(planlist.get(d).getArvt().replaceAll("[^0-9]", ""));
							int bdept = Integer.parseInt(planlist1.get(i).getDept().replaceAll("[^0-9]", ""));
							int cht = bdept - aarvt;
							if (cht <= 0) {

							} else {
								int cnt3 = 0;

								cnt3 = dao.checkbook(fromdate, planlist.get(d).getSno());
								if (cnt3 < 3) {
									planlist4.add(planlist.get(d));
								}

							}
						}
					}
					req.setAttribute("fromdate", fromdate);
					req.setAttribute("todate", todate);
					req.setAttribute("plans", planlist4);
					req.setAttribute("plan2", planlist3);
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

			req.setAttribute("pluscost", a);
			req.setAttribute("fromdate", fromdate);
			req.setAttribute("todate", todate);
			req.setAttribute("plan1", plan1);
			req.setAttribute("plan2", plan2);
			RequestDispatcher rd = req.getRequestDispatcher("/book.jsp");
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

			RequestDispatcher rd = req.getRequestDispatcher("/seattest.jsp");
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
		}else if (action.equals("book3_delete")) {
			req.setCharacterEncoding("utf-8");
			
			RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
			rd.forward(req, resp);
		}

	}

}
