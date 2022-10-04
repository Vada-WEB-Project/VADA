package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vada.constants.VADAConstants;
import vada.dao.BoardViewDAO;
import vada.dto.BoardDTO;
import vada.dto.CategoryDTO;
import vada.dto.ImgDTO;
import vada.dto.ProductpriceDTO;

public class BoardViewDAOImpl extends BoardDAOImpl implements BoardViewDAO {

	@Override
	public Map<String, Object> viewBoard(int productnum) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		Connection conn = getConnection();
		System.out.println("conn ===> " + conn);
		PreparedStatement pstmt1 = conn.prepareStatement(VADAConstants.props.getProperty("SELECT_BOARD_PRICE_SQL"));

		pstmt1.setInt(1, productnum);

		PreparedStatement pstmt2 = conn.prepareStatement(VADAConstants.props.getProperty("SELECT_BOARD_CATEGORY_SQL"));
		pstmt2.setInt(1, productnum);

		PreparedStatement pstmt3 = conn.prepareStatement(VADAConstants.props.getProperty("SELECT_BOARD_IMG_SQL"));
		pstmt3.setInt(1, productnum);
		
		ResultSet rs1 = pstmt1.executeQuery();
		ResultSet rs2 = pstmt2.executeQuery();
		ResultSet rs3 = pstmt3.executeQuery();

		BoardDTO boardDTO = null;
		ProductpriceDTO productDTO = null;
		CategoryDTO categoryDTO = null;
		ImgDTO imgDTO = null;

		if (rs1 != null && rs1.next()) {
			
			boardDTO = new BoardDTO();
			productDTO = new ProductpriceDTO();
			
			boardDTO.setTitle(rs1.getString("title"));
			boardDTO.setBcategorynum(rs1.getInt("bcategorynum"));
			boardDTO.setContent(rs1.getString("content"));
			boardDTO.setProductnum(productnum);
			productDTO.setProductprice(rs1.getInt("productprice"));
			
		}

		if (rs2 != null && rs2.next()) {
			categoryDTO = new CategoryDTO();
			categoryDTO.setCategoryname(rs2.getString("categoryname"));
		}
		
		List list = new ArrayList();
		
		while (rs3 != null && rs3.next()) {
			imgDTO = new ImgDTO();
			
			imgDTO.setImgsname(rs3.getString("imgsname"));
			
			list.add(imgDTO.getImgsname());
			
		}

		map.put("boardDTO", boardDTO);
		map.put("ProductpriceDTO", productDTO);
		map.put("categoriesDTO", categoryDTO);
		map.put("imglist", list);

		closeConnection(rs1, pstmt1, conn);
		closeConnection(rs2, pstmt2);
		closeConnection(rs3, pstmt3);
		
		return map;

	} // viewBoard

} // class
