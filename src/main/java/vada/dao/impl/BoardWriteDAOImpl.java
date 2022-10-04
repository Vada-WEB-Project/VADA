package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vada.constants.VADAConstants;
import vada.dao.BoardWriteDAO;
import vada.dto.BoardDTO;
import vada.dto.ImgDTO;
import vada.dto.NotifylistDTO;

public class BoardWriteDAOImpl extends BoardDAOImpl implements BoardWriteDAO {

	@Override
	public int writeBoard(BoardDTO boardDTO) throws Exception {

		PreparedStatement pstmt = getConnection().prepareStatement(VADAConstants.props.getProperty("WRITE_SQL"));

		pstmt.setString(1, boardDTO.getSellerid());
		pstmt.setString(2, boardDTO.getTitle());
		pstmt.setString(3, boardDTO.getContent());
		pstmt.setInt(4, boardDTO.getBcategorynum());
		pstmt.setString(5, boardDTO.getBuyerid());

		int result = pstmt.executeUpdate();
		
		closeConnection(pstmt, getConnection());
		
		return result;

	} // writeBoard

	@Override
	public int notifyWriteBoard(NotifylistDTO notifyDTO, int notifyProductNum, String userid) throws Exception {

		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(VADAConstants.props.getProperty("NOTIFY_WRITE_SQL"));

		pstmt.setInt(1, notifyProductNum);
		pstmt.setString(2, notifyDTO.getNotifyreason());
		pstmt.setString(3, userid);
		pstmt.executeUpdate();

		closeConnection(pstmt, conn);

		Connection conn2 = getConnection();
		PreparedStatement pstmt2 = conn2.prepareStatement(VADAConstants.props.getProperty("NOTIFYID_SQL"));
		ResultSet rs = pstmt2.executeQuery();
		int result = 0;
		if (rs != null && rs.next()) {
			result = rs.getInt("notifyid");
			System.out.println("result========>" + result);
		}
		closeConnection(rs, pstmt2, conn);

		return result;
	}

} // class