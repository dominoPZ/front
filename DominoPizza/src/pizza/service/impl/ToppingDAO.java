package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.ToppingDTO;
import pizza.service.ToppingService;

@Repository
public class ToppingDAO implements ToppingService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	@Override
	public List<ToppingDTO> selectList(Map map) {
		return template.selectList("addToppingSelectList", map);
	}

	@Override
	public ToppingDTO selectOne(ToppingDTO dto) {
		
		return null;
	}

	@Override
	public int insert(ToppingDTO dto) {
		
		return 0;
	}

	@Override
	public int update(ToppingDTO dto) {
		
		return 0;
	}

	@Override
	public int delete(ToppingDTO dto) {
		
		return 0;
	}

}
