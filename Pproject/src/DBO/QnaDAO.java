package DBO;

import java.util.List;

import Model.Qna;

public interface QnaDAO {
	
	List<Qna> selectall();
	List<Qna> selectAll(int rowStartNumber, int rowEndNumber);
	
	List<Qna> selectByWriter(String writer);
	Qna selectByNo(int no);
	
	boolean insert(Qna qna);
	void update(Qna qna);
	boolean deleteByNo(int no);

}
