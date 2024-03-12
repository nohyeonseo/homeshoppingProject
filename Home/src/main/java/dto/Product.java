package dto;
//상품목록 메인페이지를 불러들여오는 자바 
import java.io.Serializable;

public class Product implements Serializable
{
	private static final long serialVersionUID = -427470057203867700L;
	
	private String productId;   // 상품 아이디
	private String pname;       // 상품명
	private String filename;	//이미지 파일명
	private String description; // 상품설명
	private String category;    // 분류
	private Integer unitPrice;  // 상품 가격
	private int quantity;       //장바구니에 담은 개수

	public String getFilename() {
		return filename;
	}	
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public Product() {
		
	}
	
	public Product(String productId, String pname, Integer unitPrice) 
	{
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}
	
	public String getProductId() {
		return productId;
		}
	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}