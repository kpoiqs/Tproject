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

	private static final String INSERT_BOOK = "insert into book values(?,?,?,?,book_seq1.nextval)";

	private static final String CHECKBOOK_SQL = "select count(sno) as cnt from book where day = ?  and sno=?";

	

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

		}

		return a;

	}







	

}
