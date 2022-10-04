package vada.service;

import java.util.Map;

import vada.dto.BoardDTO;

public interface BoardViewService extends BoardService {
	
	public abstract Map<String, Object> viewBoard(int bid) throws Exception;

}
