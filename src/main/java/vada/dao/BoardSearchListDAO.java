package vada.dao;

import java.util.List;
import java.util.Map;

import vada.service.BoardSearchListService;

public interface BoardSearchListDAO extends BoardSearchListService{
	
//	public abstract List<BoardDTO> listBoard(String searchCate, String searchTextParam) throws Exception;
	
//	public abstract int countAttachFiles(int bid) throws Exception;
	
	public abstract List<Map> listBoard(String searchText) throws Exception;
	
//	public abstract int countBoard(Map<String, String> searchCriteria) throws Exception;

}
