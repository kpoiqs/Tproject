package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.org.apache.regexp.internal.recompile;

import Model.C;

public class CDAOIMPL extends BaseDAO implements CDAO{
	
	private static final String C_SELECT_BY_ID
	="select * from c where id=? and pwd=?";
	private static final String C_INSERT
	="insert into c values(c_seq.nextval ,? ,? ,?)";
	private static final String C_ID_CHECK
	="select count(*) as overlap from c where id=";
	private static final String C_FIND
	="select * from c where email=?";
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
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(C_INSERT);
			preparedStatement.setString(1, c.getId());
			preparedStatement.setString(2, c.getPwd());
			preparedStatement.setString(3, c.getEmail());
			int rowCount = preparedStatement.executeUpdate();
		if(rowCount>0) {
			result = true;
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(null, preparedStatement, connection);
		}
		return result;
	}

	@Override
	public int checkById(String id) {
		int count = 0;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(C_ID_CHECK);
			preparedStatement.setString(1, id);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				count = resultSet.getInt("overlap");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	@Override
	public C selectByEmail(String email) {
		C c = null;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(C_FIND);
			preparedStatement.setString(1,email);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				c = new C();
				c.setId(resultSet.getString("id"));
				c.setEmail(resultSet.getString("email"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}return c;
	}
}

