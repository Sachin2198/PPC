package DAO;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import model.Login;
import model.MySession;
public class LoginDAO {
	
	
	public void addUserLogin(Login login) {
		Session session = MySession.getSession();
		Transaction tran = session.beginTransaction();
		session.persist(login);
		tran.commit();
		session.close();

	}
	
	public Login findUserByNAme(String userName) {
		
		Session session = MySession.getSession();
		Query query = session.createQuery("select user from Login user where user.UserName=:UserName");
		query.setString("UserName",userName );
		List<Login> lg= query.list();
		Login u= null;
		if(lg.size()==1)
			u = lg.get(0);
		return u;
	}
	
	public Login userAuthentication(String userName,String password) {
		Session session = MySession.getSession();
		
		Query query = session.createQuery("select user from Login user where user.UserName=:userName and user.password=:password");
		query.setString("userName",userName );
		query.setString("password",password);
		List<Login> lg= query.list();
		Login u = null;
		if(lg.size()==1)
			u = lg.get(0);
		return u;
		
	}
	public static String sha1(String input) throws NoSuchAlgorithmException{
		MessageDigest mDigest=MessageDigest.getInstance("SHA1");
		byte[] result =mDigest.digest(input.getBytes());
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<result.length;i++) {
			sb.append(Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1));
		}
		
		return sb.toString();
	}
}
