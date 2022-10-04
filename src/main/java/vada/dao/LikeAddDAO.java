package vada.dao;

import vada.service.LikeService;

public interface LikeAddDAO extends LikeService{
	
	public abstract int likeAdd(String userid, int productnum) throws Exception; 

}
