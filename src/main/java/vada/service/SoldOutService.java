package vada.service;

public interface SoldOutService extends BoardService {
	
	public abstract int soldOut(String userid, int productnum) throws Exception;

}
