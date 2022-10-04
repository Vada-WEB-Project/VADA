package vada.dao;

import vada.service.SoldOutService;

public interface SoldOutDAO extends SoldOutService {

	public abstract int soldOut(String userid,int productnum) throws Exception;
}
