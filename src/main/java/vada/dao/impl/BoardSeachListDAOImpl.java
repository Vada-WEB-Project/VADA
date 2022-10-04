package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import vada.constants.VADAConstants;
import vada.dao.BoardSearchListDAO;
import vada.dto.BoardDTO;

public class BoardSeachListDAOImpl extends BoardDAOImpl implements BoardSearchListDAO {

	@Override
	public List<Map> listBoard(String searchText) throws Exception {

		Connection conn = getConnection();
		
		StringBuffer strbuf = new StringBuffer();
		
		strbuf.append("%");
		strbuf.append(searchText);
		strbuf.append("%");
		
		String likequery = strbuf.toString();
				
		PreparedStatement pstmt = conn.prepareStatement(VADAConstants.props.getProperty("SEARCH_VADA_LIST_SQL"));
		
		pstmt.setString(1, likequery); 
		
		ResultSet rs = pstmt.executeQuery();
		
		List<Map> list = new ArrayList<Map>();
		
		while (rs.next()) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("sellerid", rs.getString("sellerid"));
			map.put("title", rs.getString("title"));
			map.put("productnum", rs.getInt("productnum"));
			map.put("wdate", rs.getTimestamp("wdate"));
			map.put("bcategorynum", rs.getInt("bcategorynum"));
			
			list.add(map);
			
		}
		
		closeConnection(rs, pstmt, conn);
		
		return list;
		
	} // listBoard

// 카테고리랑 같이 검색할떄 쓰고
//	private String getWhereSQL(Map<String, String> searchCriteria) {
//
//		StringBuffer whereSQLBuffer = new StringBuffer();
//
//		if (searchCriteria != null) {
//			String bcategorynum = (String) searchCriteria.get("bcategorynum"); 
//			
//			if (bcategorynum.equals(""))
//				whereSQLBuffer.append(" where 1=1 "); 
//
//			else {
//				whereSQLBuffer.append(" where bcategorynum like '%");
//				whereSQLBuffer.append(bcategorynum);
//				whereSQLBuffer.append("%' ");
//			}
//
//			String searchDomainValue = searchCriteria.get("searchBcategorynum");
//			
//			String searchTextValue = searchCriteria.get("searchText");
//			
//			if (searchDomainValue != null && !searchDomainValue.equals("") && searchTextValue != null) { // 검색어가 있으면 아래
//
//				whereSQLBuffer.append(" and ");
//				whereSQLBuffer.append(searchDomainValue);
//				whereSQLBuffer.append(" like '%");
//				whereSQLBuffer.append(searchTextValue);
//				whereSQLBuffer.append("%' ");
//			}
//		}
//
//		return whereSQLBuffer.toString();
//
//	} // getWhereSQL

	

	// class
}
