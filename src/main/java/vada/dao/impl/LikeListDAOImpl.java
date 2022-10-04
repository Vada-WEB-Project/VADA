package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vada.constants.VADAConstants;
import vada.dao.LikeAddDAO;
import vada.dto.BoardDTO;
import vada.dto.ImgDTO;
import vada.dto.ProductpriceDTO;

public class LikeListDAOImpl extends AbstractLikeDAO implements LikeAddDAO {

	@Override
	public List<Map> likeList(String userid) throws Exception {

		String getNum = VADAConstants.props.getProperty("LIKE_PRODUCT_NUM_SQL");
		Connection conn2 = getConnection();
		PreparedStatement pstmt2 = conn2.prepareStatement(getNum);
		pstmt2.setString(1, userid);
		ResultSet rs2 = pstmt2.executeQuery();
		List<Integer> list = new ArrayList<Integer>();
		while (rs2.next()){
			list.add(rs2.getInt("likeproductnum"));
		}
		System.out.println("list@@@@@@@@@@@@@@@@@@@@@=====>"+list);
		closeConnection(rs2, pstmt2, conn2);
		
		List<Map> list2 = list2 = new ArrayList<Map>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		for(int productnum:list) {
			Connection conn = getConnection();
			String listSQL = VADAConstants.props.getProperty("LIKELIST_SQL");

			PreparedStatement pstmt = conn.prepareStatement(listSQL);
			pstmt.setInt(1, productnum);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				ImgDTO imgDTO = new ImgDTO();
				ProductpriceDTO productPriceDTO = new ProductpriceDTO();

				boardDTO.setTitle(rs.getString("title"));
				boardDTO.setProductnum(rs.getInt("productnum"));
				boardDTO.setWdate(rs.getTimestamp("wdate"));

				imgDTO.setImgsname(rs.getString("imgsname"));
				imgDTO.setImgproductnum(rs.getInt("imgproductnum"));

				Map<String, Object> map2 = new HashMap<String, Object>();

				map2.put("title", boardDTO.getTitle());
				map2.put("productnum", boardDTO.getProductnum());
				map2.put("wdate", boardDTO.getWdate());
				map2.put("imgsname", imgDTO.getImgsname());
				map2.put("imgproductnum", imgDTO.getImgproductnum());

				list2.add(map2);

			}
			closeConnection(rs, pstmt, conn);
		}
		
		System.out.println(list2);

		return list2;
	} // listBoard
}
