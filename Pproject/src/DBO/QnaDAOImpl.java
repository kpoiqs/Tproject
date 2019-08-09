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
	="insert into qna values (qna_seq.nextval,?,?,?,sysdate)";
	
	private static final String Q_SELECTALL_SQL
	="select * from qna order by no desc";
	
	private static final String Q_SELECTBYNO_SQL
	="select * from qna where no = ?";
	
	private static final String Q_DELETE_SQL
	="delete from qna where no=?";
	
	private static final String Q_UPDATE_SQL
	="update qna set content=? where no=?";
	
	private static final String Q_PAGE_SQL
	="select * from (select rownum rn, q.* from (select * from qna order by no desc) q) where rn BETWEEN ? and ?";
	
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
				q.setWdate(resultSet.getString("wdate"));
				
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
		Qna qna = null;
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_SELECTBYNO_SQL);
			preparedStatement.setInt(1, no);
			resultSet = preparedStatement.executeQuery();
		if(resultSet.next()) {
			qna = new Qna();
			
			qna.setNo(resultSet.getInt("no"));
			qna.setWriter(resultSet.getString("writer"));
			qna.setSubject(resultSet.getString("subject"));
			qna.setContent(resultSet.getString("content"));
		}
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			CloseDBObjects(resultSet, preparedStatement, connection);
		}
		return qna;
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
	
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_UPDATE_SQL);
			
			preparedStatement.setString(1, qna.getContent());
			preparedStatement.setInt(2, qna.getNo());
			
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
	public boolean deleteByNo(int no) {
		boolean result = false;
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_DELETE_SQL);
			
			preparedStatement.setInt(1, no);

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
	public List<Qna> selectAll(int rowStartNumber, int rowEndNumber) {
		List<Qna> qna = new ArrayList<Qna>();
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			preparedStatement = connection.prepareStatement(Q_PAGE_SQL);
			preparedStatement.setInt(1, rowStartNumber);
			preparedStatement.setInt(2, rowEndNumber);
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Qna q = new Qna();
				q.setNo(resultSet.getInt("no"));
				q.setSubject(resultSet.getString("subject"));
				q.setContent(resultSet.getString("content"));
				q.setWriter(resultSet.getString("writer"));
				q.setWdate(resultSet.getString("wdate"));
				
			
				qna.add(q);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			CloseDBObjects(resultSet, preparedStatement,connection);
		}
		
		return qna;
	}	

}
