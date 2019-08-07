package Controller;

import DBO.CDAO;
import DBO.CDAOIMPL;
import Model.C;

public class test {

	public static void main(String[] args) {
		CDAO dao = new CDAOIMPL();
		C a = dao.selectByEmail("email@jeon");
		System.out.println(a);
		
	}

}
