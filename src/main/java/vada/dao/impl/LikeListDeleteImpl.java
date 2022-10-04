package vada.dao.impl;

import java.sql.PreparedStatement;

import vada.constants.VADAConstants;
import vada.dao.LikeAddDAO;

public class LikeListDeleteImpl extends AbstractLikeDAO implements LikeAddDAO {

	@Override
	public int likeDelete(String userid, int productnum) throws Exception {
		PreparedStatement pstmt = getConnection().prepareStatement(VADAConstants.props.getProperty("LIKEDELETE_SQL"));
		pstmt.setInt(1, productnum);
		pstmt.setString(2, userid);
		int result = pstmt.executeUpdate();
		closeConnection(pstmt, getConnection());
		return 0;
	}
}
