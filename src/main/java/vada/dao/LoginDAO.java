package vada.dao;

import vada.dto.UserDTO;
import vada.service.LoginService;

public interface LoginDAO extends LoginService{
	public UserDTO userLogin(String userid, String userpw, String adminyn) throws Exception;
}
