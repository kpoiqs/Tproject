package DBO;

import java.util.List;

import Model.Qna;

public interface QnaDAO {
	
	List<Qna> selectall();
	
	List<Qna> selectByWriter(String writer);
	Qna selectByNo(int no);
	
	boolean insert(Qna qna);
	boolean update(Qna qna);
	boolean deleteByNo(int no);

}
