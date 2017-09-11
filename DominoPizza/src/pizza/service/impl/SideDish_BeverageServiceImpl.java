package pizza.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import pizza.service.SideDish_BeverageDTO;
import pizza.service.SideDish_BeverageService;
import pizza.service.ToppingDTO;

@Service("sideDish_BeverageService")
public class SideDish_BeverageServiceImpl implements SideDish_BeverageService{
	@Resource(name="sideDish_BeverageDAO")
	private SideDish_BeverageDAO dao;

	@Override
	public List<SideDish_BeverageDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public SideDish_BeverageDTO selectOne(SideDish_BeverageDTO dto) {
		return dao.selectOne(dto);
	}

	@Override
	public int insert(SideDish_BeverageDTO dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(SideDish_BeverageDTO dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(SideDish_BeverageDTO dto) {
		return dao.delete(null);
	}

}
