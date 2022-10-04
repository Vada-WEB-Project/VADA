package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import vada.constants.VADAConstants;
import vada.dao.LoginDAO;
import vada.dto.UserDTO;

public class LoginDAOImpl extends BoardDAOImpl implements LoginDAO {

	@Override
	public UserDTO userLogin(String userid, String userpw, String adminyn) throws Exception {
		Connection conn = getConnection();

		String sql = VADAConstants.props.getProperty("USER_LOGIN_SQL");

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, userid);
		pstmt.setString(2, userpw);
		pstmt.setString(3, adminyn);

		rs = pstmt.executeQuery();
		UserDTO userDTO = null;
		while (rs.next()) {
			userDTO = new UserDTO();
			userDTO.setUserid(rs.getString("userid"));
			userDTO.setUserpw(rs.getString("userpw"));
			userDTO.setAdminyn(rs.getString("adminyn"));
			userDTO.setBlackyn(rs.getString("blackyn"));
			userDTO.setJoindate(rs.getTimestamp("joindate"));

		}

		closeConnection(rs, pstmt, conn);
		return userDTO;
	}

	public List<UserDTO> listBoard(String userid, Timestamp joindate, String blackyn) throws SQLException {
		Connection conn = getConnection();

		String sql = VADAConstants.props.getProperty("USER_LOGIN_SQL");
		PreparedStatement pstmt = null;
		StringBuffer whereSQLBuffer = new StringBuffer();
		ResultSet rs = null;

		List<UserDTO> list = new ArrayList<UserDTO>();
		while (rs.next()) {
			UserDTO userDTO = new UserDTO();
			userDTO.setUserid(rs.getString("userid"));
			userDTO.setJoindate(rs.getTimestamp("joindate"));
			userDTO.setBlackyn(rs.getString("blackyn"));
			list.add(userDTO);

		}
		closeConnection(rs, pstmt, conn);
		return list;
	}
}
