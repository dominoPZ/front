package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.SideDish_PickleDTO;
import pizza.service.SideDish_PickleService;

@Repository
public class SideDish_PickleDAO implements SideDish_PickleService {
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<SideDish_PickleDTO> selectList(Map map) {
		return template.selectList("sideDishPickleSelectList", map);
	}

	@Override
	public SideDish_PickleDTO selectOne(SideDish_PickleDTO dto) {
		
		return null;
	}

	@Override
	public int insert(SideDish_PickleDTO dto) {
		
		return 0;
	}

	@Override
	public int update(SideDish_PickleDTO dto) {
		
		return 0;
	}

	@Override
	public int delete(SideDish_PickleDTO dto) {
		
		return 0;
	}
	
}
