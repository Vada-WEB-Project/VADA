package vada.dao;

import java.util.Map;

import vada.dto.BoardDTO;
import vada.service.BoardViewService;

public interface BoardViewDAO extends BoardViewService {
	
	public abstract Map<String, Object> viewBoard(int bid) throws Exception;

}
