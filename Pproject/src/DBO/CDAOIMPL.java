package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.C;

public class CDAOIMPL extends BaseDAO implements CDAO{
	
	private static final String C_SELECT_BY_ID
	="select * from c where id=?";
	
	@Override
	public C selectById(String id) {
		C c = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(C_SELECT_BY_ID);
			preparedStatement.setString(1, id);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				c = new C();
				c.setNo(resultSet.getInt("no"));
				c.setId(resultSet.getString("id"));
				c.setPwd(resultSet.getString("pwd"));
				c.setEmail(resultSet.getString("email"));
			}
		}catch(SQLException a) {
			a.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}return c;
	}

}
