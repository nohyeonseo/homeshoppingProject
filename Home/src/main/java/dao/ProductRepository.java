package dao;
//상품 상세 정보를 가져오는 메소드
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import mvc.database.DBConnection;
import dto.Product;

public class ProductRepository
{
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();
	
	public static ProductRepository getInstance() 
	{
		return instance;
	}
	
	public Product getProductByIdFromDB(String productId) throws ClassNotFoundException 
	{
	    Connection connection = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    Product product = null;

	    try {
	        connection = DBConnection.getConnection(); // DB 연결
	        String sql = "SELECT * FROM product WHERE p_id = ?";
	        pstmt = connection.prepareStatement(sql);
	        pstmt.setString(1, productId);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            product = new Product();
	            product.setProductId(rs.getString("p_id"));
	            product.setPname(rs.getString("p_name"));
	            product.setDescription(rs.getString("p_description"));
	            product.setCategory(rs.getString("p_category"));
	            product.setUnitPrice(rs.getInt("p_unitPrice"));
	            product.setFilename(rs.getString("p_fileName"));
	        }
	    } 
	    catch (SQLException e) 
	    {
	        e.printStackTrace();
	    } 
	    finally 
	    {
	        // 연결, pstmt, rs 닫기
	        try 
	        {
	            if (rs != null) 
	            {
	                rs.close();
	            }
	            if (pstmt != null) 
	            {
	                pstmt.close();
	            }
	            if (connection != null) 
	            {
	                connection.close();
	            }
	        } 
	        catch (SQLException e) 
	        {
	            e.printStackTrace();
	        }
	    }
	    return product;
	}
	
	
	public ArrayList<Product> getAllProducts() 
	{
		return listOfProducts;
	}
	
	public Product getProductById(String productId) {
        Product productById = null;

        for (int i = 0; i < listOfProducts.size(); i++) {
            Product product = listOfProducts.get(i);
            if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
                productById = product;
                break;
            }
        }

        if (productById == null) {
            try {
                productById = getProductByIdFromDB(productId);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }

        return productById;
    }

	public void addProduct(Product product)   
	{
	      listOfProducts.add(product);
	}
}