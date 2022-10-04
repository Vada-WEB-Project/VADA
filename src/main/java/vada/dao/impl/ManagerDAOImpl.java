package vada.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vada.constants.VADAConstants;
import vada.dao.ManagerDAO;
import vada.dto.BoardDTO;
import vada.dto.ProductpriceDTO;
import vada.dto.UserDTO;

public class ManagerDAOImpl extends BoardDAOImpl implements ManagerDAO {

   @Override
   public List<UserDTO> listBoard(String userid) throws Exception {
      String prependSQL = VADAConstants.props.getProperty("MANAGER_SEARCH_SQL");

      Connection conn = getConnection();
      PreparedStatement pstmt = conn.prepareStatement(prependSQL);
      ResultSet rs = pstmt.executeQuery();

      List<UserDTO> list = new ArrayList<UserDTO>();
      while (rs.next()) {
         UserDTO boardDTO = new UserDTO();
         boardDTO.setUserid(rs.getString("userid"));
         boardDTO.setJoindate(rs.getTimestamp("joindate"));
         boardDTO.setBlackyn(rs.getString("blackyn"));

         list.add(boardDTO);
      }

      closeConnection(rs, pstmt, conn);

      return list;
   }

   @Override
   public int blackList(String userid, String blackyn) throws Exception {

      Connection conn = getConnection();
      UserDTO boardDTO = new UserDTO();

      PreparedStatement pstmt = conn.prepareStatement(VADAConstants.props.getProperty("MANAGER_BLACK_CHANGE"));
      
      pstmt.setString(1, blackyn);
      pstmt.setString(2, userid);
      
      int result = pstmt.executeUpdate();
      
      closeConnection(pstmt, conn);
      
      return result;
   }
   
}