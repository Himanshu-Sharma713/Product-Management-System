package com.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class ProductService {
    private ProductDao dao;

    // Public no-arg constructor is required for <jsp:useBean>
    
    public ProductService() {
        dao = new ProductDao();
        System.out.println("service created");
    }

    public void saveProductRecord(HttpServletRequest request) {
        Product product = new Product();
        product.setPid(Integer.parseInt(request.getParameter("pid")));
        product.setName(request.getParameter("name"));
        product.setBrand(request.getParameter("brand"));
        product.setPrice(Integer.parseInt(request.getParameter("price")));

        // Pass product object instead of null
        dao.saveProduct(product);
    }
    public Product getProductRecord(int pid)
    {
    	Product p = dao.getProduct(pid);
    	return p;
    }
    public void deleteProductRecord(int pid)
    {
    	Product p =dao.getProduct(pid);
    	dao.deleteProduct(p);
    	
    }
    public List <Product> getProductList()
    {
    	return dao.getList();
    	
    }
    public void updateProductRecord(HttpServletRequest request)
	{
		int pid=Integer.parseInt(request.getParameter("pid"));
		Product producto=dao.getProduct(pid);
		Product productn=new Product();
		productn.setPid(pid);
		productn.setName(request.getParameter("name"));
		productn.setBrand(request.getParameter("brand"));
		productn.setPrice(Integer.parseInt(request.getParameter("price")));
		dao.updateProduct(producto,productn);
	}
    
}
