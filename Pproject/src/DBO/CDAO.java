package DBO;

import Model.C;

public interface CDAO {
	C selectById(String id , String pwd);
	boolean insert(C c);
}
