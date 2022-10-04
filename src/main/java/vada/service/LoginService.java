package vada.service;

import vada.dto.UserDTO;

public interface LoginService {
	
	public UserDTO userLogin(String userid, String userpw, String adminyn) throws Exception;
	
	
	
}
