package DBO;

import java.util.List;

import Model.plan;

public interface PlanDAO {

	List<plan> selectname12(String depa , String arva);
	int pluscost(String depa,String arva);
	
	plan selectbysno(String sno);
}
