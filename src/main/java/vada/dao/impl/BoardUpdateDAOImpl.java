package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vada.constants.VADAConstants;
import vada.dao.BoardUpdateDAO;
import vada.dto.BoardDTO;

public class BoardUpdateDAOImpl 
	extends BoardDAOImpl implements BoardUpdateDAO {

	@Override
	public int updateBoard(BoardDTO boardDTO) throws Exception {
		Connection conn = getConnection();
		PreparedStatement pstmt 
			= conn.prepareStatement(VADAConstants.props.getProperty("UPDATE_SQL"));
//		pstmt.setString(1, boardDTO.getBtitle());
//		pstmt.setString(2, boardDTO.getBcontent());
//		pstmt.setString(3, boardDTO.getBdomain());
//		pstmt.setString(4, boardDTO.getBwriterid());
//		pstmt.setInt(5, boardDTO.getBid());
		int result = pstmt.executeUpdate();
		closeConnection(pstmt, conn);
		return result;
	} // updateBoard

} // class












