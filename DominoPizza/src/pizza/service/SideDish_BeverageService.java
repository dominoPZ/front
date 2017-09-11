package pizza.service;

import java.util.List;
import java.util.Map;

public interface SideDish_BeverageService {
	//목록용]
	List<SideDish_BeverageDTO> selectList(Map map);
	//상세보기용]
	SideDish_BeverageDTO selectOne(SideDish_BeverageDTO dto);
	//입력/수정/삭제용]
	int insert(SideDish_BeverageDTO dto);
	int update(SideDish_BeverageDTO dto);
	int delete(SideDish_BeverageDTO dto);
}
