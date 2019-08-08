package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.plan;

public class PlanDAOImpl extends BaseDAO implements PlanDAO {

	private static final String PLAN_SQL_SELECTNAME1 = "select DEPA , ARVA , DepT, ARVT , SNO, cost From plan where depa = ? and arva = ?";
	
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

	
}
