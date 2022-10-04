package vada.dao;

import vada.dto.BoardDTO;
import vada.dto.NotifylistDTO;
import vada.service.BoardWriteService;

public interface BoardWriteDAO extends BoardWriteService {
	
	public abstract int writeBoard(BoardDTO boardDTO) throws Exception;
	
	public abstract int notifyWriteBoard(NotifylistDTO notifyDTO, int notifyProductNum,String userid) throws Exception;
}
