package DBO;




import java.awt.print.Book;

import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;

import java.util.List;




import Model.book;

import Model.plan;




public class PlanDAOImpl extends BaseDAO implements PlanDAO {




	private static final String PLAN_SQL_SELECTNAME1 = "select DEPA , ARVA , DepT, ARVT , SNO, cost From plan where depa = ? and arva = ?";

	private static final String PLAN_SQL_SELECT_BY_SNO = "select depa,arva,dept,arvt,sno,cost From plan where sno = ?";

	private static final String INSERT_BOOK = "insert into book values(?,?,?,?,book_seq1.nextval,?)";

	private static final String CHECKBOOK_SQL = "select count(sno) as cnt from book where day = ?  and sno=?";

	private static final String BOOK_LIST_ALL = "select id,day,pay,sno,bno from book where sysdate < to_date(day) and id = ? order by day asc";


	private static final String CHECKSEAT_SQL = "select seat from book where day = ?  and sno=?";

	private static final String BOOK_SEQ_ALL = "select id,day,pay,sno,bno from book where sysdate < to_date(day) order by day asc";

	@Override

	public List<plan> selectname12(String depa, String arva) {




		List<plan> planlist = new ArrayList<plan>();

		Connection connection = null;

		PreparedStatement preparedstatement = null;

		ResultSet resultSet = null;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(PLAN_SQL_SELECTNAME1);

			preparedstatement.setString(1,depa);

			preparedstatement.setString(2,arva);

			resultSet = preparedstatement.executeQuery();




			while (resultSet.next()) {

				plan pla = new plan();

				pla.setArva(resultSet.getString("arva"));

				pla.setArvt(resultSet.getString("arvt"));

				pla.setCost(resultSet.getInt("cost"));

				pla.setDepa(resultSet.getString("depa"));

				pla.setDept(resultSet.getString("dept"));

				pla.setSno(resultSet.getString("sno"));

				

				

				planlist.add(pla);

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {

			CloseDBObjects(resultSet, preparedstatement, connection);

		}

		return planlist;

	}







	@Override

	public plan selectbysno(String sno) {

		

		plan pla = null;

		Connection connection = null;

		PreparedStatement preparedstatement = null;

		ResultSet resultSet = null;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(PLAN_SQL_SELECT_BY_SNO);

			preparedstatement.setString(1,sno);

			resultSet = preparedstatement.executeQuery();




			if (resultSet.next()) {

				pla = new plan();

				pla.setArva(resultSet.getString("arva"));

				pla.setArvt(resultSet.getString("arvt"));

				pla.setCost(resultSet.getInt("cost"));

				pla.setDepa(resultSet.getString("depa"));

				pla.setDept(resultSet.getString("dept"));

				pla.setSno(resultSet.getString("sno"));

				

				

			}

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {

			CloseDBObjects(resultSet, preparedstatement, connection);

		}
		return pla;

	}




	@Override

	public boolean insert(book book) {

		Connection connection = null;

		PreparedStatement preparedstatement = null;

		boolean result = false;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(INSERT_BOOK);

			preparedstatement.setString(1,book.getId());

			preparedstatement.setString(2,book.getDay());

			preparedstatement.setInt(3,book.getPay());

			preparedstatement.setString(4,book.getSno());
			
			preparedstatement.setString(5,book.getSeat());

			int rownum = preparedstatement.executeUpdate();




			if (rownum > 0) {

				System.out.println("성공이염");

				result = true;

			}

		} catch (SQLException e) {

			System.out.println("출력실패");

			e.printStackTrace();

		} finally {

			CloseDBObjects(null, preparedstatement, connection);

		}

		return result;

	}







	public int checkbook(String fromdate, String sno) {

		int a=0;

		plan pla = new plan();




		Connection connection = null;

		PreparedStatement preparedstatement = null;

		ResultSet resultSet = null;

		try {

			connection = getConnection();

			preparedstatement = connection.prepareStatement(CHECKBOOK_SQL);

			preparedstatement.setString(1,fromdate);

			preparedstatement.setString(2,sno);

			resultSet = preparedstatement.executeQuery();




			if (resultSet.next()) {

				

				a = resultSet.getInt("cnt");

				

			}

			

		} catch (SQLException e) {

			e.printStackTrace();

		}finally {

			CloseDBObjects(resultSet, preparedstatement, connection);

		}

		return a;

	}







	@Override
	public List<book> bookselectall(String id) {
		List<book> planlist = new ArrayList<book>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(BOOK_LIST_ALL);
			preparedstatement.setString(1,id);
			resultSet = preparedstatement.executeQuery();
			while (resultSet.next()) {

				book book1 = new book();
				book1.setId(resultSet.getString("id"));
				book1.setBno(resultSet.getInt("bno"));
				book1.setDay(resultSet.getString("day"));
				book1.setPay(resultSet.getInt("pay"));
				book1.setSno(resultSet.getString("sno"));

				
				planlist.add(book1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return planlist;
	}

	
	public List<book> bookselectall() {
		List<book> planlist = new ArrayList<book>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(BOOK_SEQ_ALL);
			resultSet = preparedstatement.executeQuery();
			while (resultSet.next()) {

				book book1 = new book();
				book1.setId(resultSet.getString("id"));
				book1.setBno(resultSet.getInt("bno"));
				book1.setDay(resultSet.getString("day"));
				book1.setPay(resultSet.getInt("pay"));
				book1.setSno(resultSet.getString("sno"));

				
				planlist.add(book1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return planlist;
	}







	@Override
	public List<book> seatselectall(String day, String sno) {
		List<book> planlist = new ArrayList<book>();
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedstatement = connection.prepareStatement(CHECKSEAT_SQL);
			preparedstatement.setString(1,day);
			preparedstatement.setString(2,sno);
			resultSet = preparedstatement.executeQuery();
			while (resultSet.next()) {

				book book1 = new book();
				book1.setSeat(resultSet.getString("seat"));


				
				planlist.add(book1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			CloseDBObjects(resultSet, preparedstatement, connection);
		}
		return planlist;
	}







	

}
