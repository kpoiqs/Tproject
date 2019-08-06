package DBO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Qna;

public class QnaDAOImpl extends BaseDAO implements QnaDAO {
	
	private static final String Q_INSERT_SQL
	="insert into q values (q_seq.nextval,?,?,?,sysdate)";
	
	private static final String Q_SELECTALL_SQL
	="select * from q order by no desc";
	
	@Override
	public List<Qna> selectall() {
		List<Qna> qna = new ArrayList<Qna>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_SELECTALL_SQL);
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Qna q = new Qna();
				q.setNo(resultSet.getInt("no"));
				q.setSubject(resultSet.getString("subject"));
				q.setWriter(resultSet.getString("writer"));
				q.setWdate(resultSet.getInt("wdate"));
				
				qna.add(q);
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}
		return qna;
	}

	@Override
	public List<Qna> selectByWriter(String writer) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna selectByNo(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(Qna qna) {
		boolean result = false;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_INSERT_SQL);
			
			preparedStatement.setString(1, qna.getSubject());
			preparedStatement.setString(2, qna.getContent());
			preparedStatement.setString(3, qna.getWriter());
			
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
	public boolean update(Qna qna) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteByNo(int no) {
		// TODO Auto-generated method stub
		return false;
	}

}
