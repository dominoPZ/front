package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.SideDish_BeverageDTO;
import pizza.service.SideDish_BeverageService;
import pizza.service.ToppingDTO;
@Repository
public class SideDish_BeverageDAO implements SideDish_BeverageService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public List<SideDish_BeverageDTO> selectList(Map map) {
		return template.selectList("sideDishBvrgSelectList", map);
	}

	@Override
	public SideDish_BeverageDTO selectOne(SideDish_BeverageDTO dto) {
		return null;
	}

	@Override
	public int insert(SideDish_BeverageDTO dto) {
		return 0;
	}

	@Override
	public int update(SideDish_BeverageDTO dto) {
		return 0;
	}

	@Override
	public int delete(SideDish_BeverageDTO dto) {
		return 0;
	}

}
