package Controller;

import DBO.AccountDAO;
import DBO.AccountDAOImpl;

public class test {

	public static void main(String[] args) {
		AccountDAO dao = new AccountDAOImpl();
		int c = dao.checkById("kk");
		System.out.println(c);
	}

}
