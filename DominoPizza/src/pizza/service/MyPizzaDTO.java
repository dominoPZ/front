package pizza.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class MyPizzaDTO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	private String p_no;
	private String p_name;
	private String p_price;
	private String p_list;
	private String p_topping;
	private String p_origin;
	private String p_img;
	private String p_detail;
	private String p_grain;
	public String getP_no() {
		return p_no;
	}
	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_list() {
		return p_list;
	}
	public void setP_list(String p_list) {
		this.p_list = p_list;
	}
	public String getP_topping() {
		return p_topping;
	}
	public void setP_topping(String p_topping) {
		this.p_topping = p_topping;
	}
	public String getP_origin() {
		return p_origin;
	}
	public void setP_origin(String p_origin) {
		this.p_origin = p_origin;
	}
	public String getP_img() {
		return p_img;
	}
	public void setP_img(String p_img) {
		this.p_img = p_img;
	}
	public String getP_detail() {
		return p_detail;
	}
	public void setP_detail(String p_detail) {
		this.p_detail = p_detail;
	}
	public String getP_grain() {
		return p_grain;
	}
	public void setP_grain(String p_grain) {
		this.p_grain = p_grain;
	}
	
	
}
