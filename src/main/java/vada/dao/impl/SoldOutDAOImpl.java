package vada.dao.impl;

import java.sql.PreparedStatement;

import vada.constants.VADAConstants;
import vada.dao.SoldOutDAO;

public class SoldOutDAOImpl extends BoardDAOImpl implements SoldOutDAO{

	@Override
	public int soldOut(String userid, int productnum) throws Exception {
		
		PreparedStatement pstmt = getConnection().prepareStatement(VADAConstants.props.getProperty("SOLDOUT_SQL"));

		pstmt.setString(1, "testid1");
		pstmt.setInt(2, 40);

		int result = pstmt.executeUpdate();
		
		closeConnection(pstmt, getConnection());
		return result;
	}

}
