package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.BasketDTO;
import pizza.service.DoughDTO;
import pizza.service.PNutrientDTO;
import pizza.service.PizzaDTO;
import pizza.service.PizzaMenuList;


@Repository
public class Daotest {
	
	
	
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	public int test(Map map){
		System.out.println("되냐");
		System.out.println(template);
		int count = template.insert("mybatisTest",map);
		return count;
	}
	
	public List<PizzaMenuList> menuList(Map map){
		System.out.println("dao 내부");
		
		System.out.println(map.get("fro"));
		System.out.println(map.get("sel"));
		List<PizzaMenuList> count = null;
		if(map.get("ty").toString().equals("104")) {
			
			count = template.selectList("mybatisSideMenu",map);
		}
		else
			count = template.selectList("mybatisMenu",map);
		
		
	/*	else if(map.get("ty").toString().equals("2"))
			count = template.selectList("mybatisMen2",map);
		else if(map.get("ty").toString().equals("3"))
			count = template.selectList("mybatisMenu3",map);*/
		System.out.println("바티스 종료");
		return count;
	}

	public int addrselect(Map map) {
		return template.insert("mybatisaddrselect",map);
		
	}

	public PizzaDTO pizzaview(Map map) {
		return template.selectOne("mybatisPizzaview",map);
	}

	public List<DoughDTO> doughlist(Map map) {
		return template.selectList("mybatisDoughlist",map);
	}

	public List<PNutrientDTO> pnutrient(Map map) {
		return template.selectList("mybatispnutrient",map);
	}

	public int sinsert(Map map) {
		return template.insert("mybatissinsert",map);
	}

	public int stinsert(BasketDTO dto) {
		return template.insert("mybatisstinsert",dto);
	}
	
	
}
