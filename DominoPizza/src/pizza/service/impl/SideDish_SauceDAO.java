package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import pizza.service.SideDish_SauceDTO;
import pizza.service.SideDish_SauceService;

@Repository
public class SideDish_SauceDAO implements SideDish_SauceService {
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<SideDish_SauceDTO> selectList(Map map) {
		System.out.println("5");
		return template.selectList("sideDishSauceSelectList", map);
	}

	@Override
	public SideDish_SauceDTO selectOne(SideDish_SauceDTO dto) {
		
		return null;
	}

	@Override
	public int insert(SideDish_SauceDTO dto) {
		
		return 0;
	}

	@Override
	public int update(SideDish_SauceDTO dto) {
		
		return 0;
	}

	@Override
	public int delete(SideDish_SauceDTO dto) {
		
		return 0;
	}
	
}
