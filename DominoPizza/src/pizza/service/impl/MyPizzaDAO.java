package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.MyPizzaDTO;
import pizza.service.MyPizzaService;
@Repository
public class MyPizzaDAO implements MyPizzaService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<MyPizzaDTO> selectList(Map map) {
		return template.selectList("pizzaSelectList",map);
	}

	@Override
	public MyPizzaDTO selectOne(MyPizzaDTO dto) {
		return null;
	}

	@Override
	public int insert(MyPizzaDTO dto) {
		return 0;
	}

	@Override
	public int update(MyPizzaDTO dto) {
		return 0;
	}

	@Override
	public int delete(MyPizzaDTO dto) {
		return 0;
	}

}
