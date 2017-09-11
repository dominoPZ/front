package pizza.service;

import java.util.List;
import java.util.Map;

public interface SideDish_SauceService {
	//목록용]
	List<SideDish_SauceDTO> selectList(Map map);
	//상세보기용]
	SideDish_SauceDTO selectOne(SideDish_SauceDTO dto);
	//입력/수정/삭제용]
	int insert(SideDish_SauceDTO dto);
	int update(SideDish_SauceDTO dto);
	int delete(SideDish_SauceDTO dto);
}
