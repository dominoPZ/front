package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.SideDish_SauceDTO;
import pizza.service.SideDish_SauceService;

@Service("sideDish_SauceService")
public class SideDish_SauceServiceImpl implements SideDish_SauceService{
	@Resource(name="sideDish_SauceDAO")
	private SideDish_SauceDAO dao;

	@Override
	public List<SideDish_SauceDTO> selectList(Map map) {
		System.out.println("4");
		return dao.selectList(map);
	}

	@Override
	public SideDish_SauceDTO selectOne(SideDish_SauceDTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(SideDish_SauceDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(SideDish_SauceDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(SideDish_SauceDTO dto) {
		return dao.delete(dto);
	}
	
}
