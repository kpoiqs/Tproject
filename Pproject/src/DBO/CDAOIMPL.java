package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.C;

public class CDAOIMPL extends BaseDAO implements CDAO{
	
	private static final String C_SELECT_BY_ID
	="select * from c where id=? and pwd=?";
	private static final String C_INSERT
	="insert into c values(c_seq.nextval ,? ,? ,?)";
	@Override
	public C selectById(String id , String pwd) {
		C c = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(C_SELECT_BY_ID);
			preparedStatement.setString(1,id);
			preparedStatement.setString(2, pwd);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				c = new C();
				c.setId(resultSet.getString("id"));
				c.setPwd(resultSet.getString("pwd"));
				c.setEmail(resultSet.getString("email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}return c;
	}

	@Override
	public boolean insert(C c) {
		// TODO Auto-generated method stub
		return false;
	}
}

