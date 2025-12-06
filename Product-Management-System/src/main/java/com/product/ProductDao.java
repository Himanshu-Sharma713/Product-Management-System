package com.product;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class ProductDao
{
	private Session session;
	private Transaction trn;
    public ProductDao()
    {
    	SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
    	session = factory.openSession();
    	trn=session.getTransaction();
    	
    }
    public void saveProduct(Product product)
    {
    	trn.begin();
    	session.persist(product);
    	trn.commit();
    }
    public Product getProduct(int pid)
    {
    	Product product = session.get(Product.class,pid );
    	return product;
    }	
    public void deleteProduct(Product product)
    {
    	trn.begin();
    	session.delete(product);
    	trn.commit();
    }
    public void updateProduct(Product producto,Product productn)
    {
    	trn.begin();
    	producto.setName(productn.getName());
    	producto.setBrand(productn.getBrand());
    	producto.setPrice(productn.getPrice());
    	trn.commit();
    }
    public List <Product> getList()
    {
    	Query<Product> query=session.createQuery("from Product",Product.class);
    	return query.list();
    }
    
    
    
}
