package model;

import org.hibernate.Session;
import org.hibernate.cfg.AnnotationConfiguration;

public class MySession {
	public static Session getSession() {
		AnnotationConfiguration config=new AnnotationConfiguration();
		config.addAnnotatedClass(Employee.class);
		config.addAnnotatedClass(Machine.class);
		config.addAnnotatedClass(MyTask.class);
		config.addAnnotatedClass(Order.class);
		config.addAnnotatedClass(RawMaterials.class);
		config.addAnnotatedClass(Request.class);
		config.addAnnotatedClass(Report.class);
		config.addAnnotatedClass(Login.class);
		config.configure("hibernate.cfg.xml");
		return config.buildSessionFactory().openSession();
	}
}
