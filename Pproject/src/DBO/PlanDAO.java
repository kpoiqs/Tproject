package DBO;

import java.awt.print.Book;
import java.util.List;

import Model.book;
import Model.plan;

public interface PlanDAO {

	List<plan> selectname12(String depa , String arva);
	
	
	plan selectbysno(String sno);
	
	boolean insert(book book);
	int checkbook(String fromdate, String sno);
	
	List<book> bookselectall(String id);
<<<<<<< HEAD
	List<book> seatselectall(String day, String sno);
=======
	
	List<book> bookselectall();
>>>>>>> branch 'master' of https://github.com/kpoiqs/Tproject
}
