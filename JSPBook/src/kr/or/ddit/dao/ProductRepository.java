package kr.or.ddit.dao;

import java.util.ArrayList;
import java.util.List;

import kr.or.ddit.dto.Product;

public class ProductRepository {
	//상품 목록 저장할 리스트 작성
	private List<Product> listOfProducts = new ArrayList<Product>();
	
	//싱글톤 객체
	private static ProductRepository instance = new ProductRepository();
	public static ProductRepository getInstance() {
		return instance;
	}
	
	//기본 생성자. 3개의 상품정보를 설정. 
	//그런 후 Product 객체 타입의 List인 listOfProducts 변수에 저장
	public ProductRepository() {
		//생성자(상품 아이디, 상품 명, 상품 가격 초기화)
		Product phone = new Product("P1234", "ipone 6s", 800000.0);
		//상품 설명
		phone.setDescription("4.7-inch, 1334x750 Renina HD display."
				+ "8-megapixel iSight Camera");
		//분류
		phone.setCategory("Smart Phone");
		//제조사
		phone.setManufacturer("Apple");
		//재고 수
		phone.setUnitsInStock(1000);
		//산성품 or 중고품 or 재생품
		phone.setCondition("New");
		//이미지 파일명
		phone.setFilename("P1234.jpg");
		
		//---------------------------- 휴대폰 등록 끝 -----------------------------
		
		//---------------------------- 노트북 등록 시작 -----------------------------
		//생성자(상품 아이디, 상품 명, 상품 가격 초기화)
		Product notebook = new Product("P1235", "LG PC 그램", 1500000.0);
		//상품 설명
		notebook.setDescription("13.3-inch, IPS LED display, 5rd Generation"
				+ "Intel Core processors");
		//분류
		notebook.setCategory("Notebook");
		//제조사
		notebook.setManufacturer("LG");
		//재고 수
		notebook.setUnitsInStock(1000);
		//산성품 or 중고품 or 재생품
		notebook.setCondition("Refurboshed");
		//이미지 파일명
		notebook.setFilename("P1235.jpg");
		
		//---------------------------- 노트북 등록 끝 -----------------------------
		
		//---------------------------- 태블릿 등록 시작 -----------------------------
		//생성자(상품 아이디, 상품 명, 상품 가격 초기화)
		Product tablet = new Product("P1236", "Galaxy Tab S", 1500000.0);
		//상품 설명
		tablet.setDescription("212.8*124.6m, Super AMOLED display"
				+ "Octa-Core processor");
		//분류
		tablet.setCategory("Tablet");
		//제조사
		tablet.setManufacturer("Samsung");
		//재고 수
		tablet.setUnitsInStock(1000);
		//산성품 or 중고품 or 재생품
		tablet.setCondition("Old");
		//이미지 파일명
		tablet.setFilename("P1236.jpg");
		
		//---------------------------- 태블릿 등록 끝 -----------------------------
		
		listOfProducts.add(phone);
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);
	}
	
	//Person 객체 타입의 변수 listOfProducts에 저장된 모든 상품 목록을 가져옴
	public List<Product> getAllProducts(){
		return listOfProducts;
	}
	
	//상품 상세보기
	//listOfProducts 변수에 저장된 3개(이상)의 상품 목록 중
	//선택한 상품의 아이디와 일치하는 상품 정보를 가져오는 메서드
	public Product getProductById(String productId) {
		Product productById = null;
		
		//상품 목록 반복(listOfProducts) 반복
		for (Product product : listOfProducts) {
			if(product.getProductId().equals(productId)) {
				productById = product;
				break;
			}
		}
		
		return productById;
	}
	
	//새로운 상품 등록(Product 타입의 파라미터를 Product 타입(dto, vo) 매개변수로 받음)
	public void addProduct(Product product) {
		//기존의 상품 목록에 추가
		listOfProducts.add(product);
	}
}
