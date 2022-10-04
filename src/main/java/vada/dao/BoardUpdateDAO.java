package vada.dao;

import vada.dto.BoardDTO;
import vada.service.BoardUpdateService;

public interface BoardUpdateDAO extends BoardUpdateService {

	public abstract int updateBoard(BoardDTO boardDTO) throws Exception;

}
