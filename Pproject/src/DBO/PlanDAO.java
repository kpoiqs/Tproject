package DBO;

import java.awt.print.Book;
import java.util.List;

import Model.book;
import Model.plan;

public interface PlanDAO {

	List<plan> selectname12(String depa , String arva);
	
	
	plan selectbysno(String sno);
	
	boolean insert(book book);
	List<plan> checkbook(String fromdate, String depa, String arva);
}
