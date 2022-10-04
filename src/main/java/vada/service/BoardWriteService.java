package vada.service;

import vada.dto.BoardDTO;
import vada.dto.NotifylistDTO;

public interface BoardWriteService extends BoardService {

	public abstract int writeBoard(BoardDTO boardDTO) throws Exception;
	
	public abstract int notifyWriteBoard(NotifylistDTO notifyDTO, int notifyProductNum,String userid) throws Exception;
}
