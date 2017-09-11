package pizza.service;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class ToppingDTO {
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	private String t_code;
	private String t_name;
	private String t_img;
	private String t_kind;
	
	//프로그램 효율성을 위한 추가
	private String ts_no;
	private String t_size;
	private String t_price;
	private String t_gram;
	
	public String getT_code() {
		return t_code;
	}
	public void setT_code(String t_code) {
		this.t_code = t_code;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_img() {
		return t_img;
	}
	public void setT_img(String t_img) {
		this.t_img = t_img;
	}
	public String getT_kind() {
		return t_kind;
	}
	public void setT_kind(String t_kind) {
		this.t_kind = t_kind;
	}
	public String getTs_no() {
		return ts_no;
	}
	public void setTs_no(String ts_no) {
		this.ts_no = ts_no;
	}
	public String getT_size() {
		return t_size;
	}
	public void setT_size(String t_size) {
		this.t_size = t_size;
	}
	public String getT_price() {
		return t_price;
	}
	public void setT_price(String t_price) {
		this.t_price = t_price;
	}
	public String getT_gram() {
		return t_gram;
	}
	public void setT_gram(String t_gram) {
		this.t_gram = t_gram;
	}
	
	
	
}
