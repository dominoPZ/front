package pizza.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import pizza.service.ToppingDTO;
import pizza.service.ToppingService;

@Service("toppingService")
public class ToppingServiceImpl implements ToppingService{
	@Resource(name="toppingDAO")
	private ToppingDAO dao;
	@Override
	public List<ToppingDTO> selectList(Map map) {
		return dao.selectList(map);
	}
	@Override
	public ToppingDTO selectOne(ToppingDTO dto) {
		return dao.selectOne(dto);
	}
	@Override
	public int insert(ToppingDTO dto) {
		return dao.insert(dto);
	}
	@Override
	public int update(ToppingDTO dto) {
		return dao.update(dto);
	}
	@Override
	public int delete(ToppingDTO dto) {
		return dao.delete(dto);
	}
}
