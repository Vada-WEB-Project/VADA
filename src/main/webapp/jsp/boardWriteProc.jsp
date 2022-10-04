<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="vada.dao.impl.BoardProductNumDAOImpl"%>
<%@ page import="vada.service.BoardProductNumService"%>
<%@ page import="java.util.Collection"%>
<%@ page import="vada.dao.impl.BoardImgWriteDAOImpl"%>
<%@ page import="vada.service.BoardImgService"%>
<%@ page import="vada.dto.ImgDTO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.Console"%>
<%@ page import="vada.dto.BoardDTO"%>
<%@ page import="vada.dao.impl.BoardWriteDAOImpl"%>
<%@ page import="vada.service.BoardWriteService"%>

<jsp:useBean id="boardDTO" class="vada.dto.BoardDTO" />
<jsp:setProperty name="boardDTO" property="*" />

<jsp:setProperty name="boardDTO" property="buyerid" value="testid1" /><% // TODO 이거는 게시글 판매 완료 처리되면 작성 %>
<jsp:setProperty name="boardDTO" property="sellerid" value="testid2" /> <% // TODO session 으로 받아온 로그인 사용자 아이디 넣어주면됨 %>
<jsp:setProperty name="boardDTO" property="bcategorynum" value="102" /> <% // TODO 카테고리 번호 가져와야함 %>

<%
	BoardWriteService boardWriteService = new BoardWriteDAOImpl();
	BoardImgService boardImgService = new BoardImgWriteDAOImpl();

	int result = boardWriteService.writeBoard(boardDTO);
	int productNum = new BoardProductNumDAOImpl().getProductNum();
		
	Collection<Part> parts = request.getParts();

	List<String> sfnList = (List<String>) request.getAttribute("sfnList");
	
	int listIndex = 0;
	
	for (Part part : parts) {
		if (part.getHeader("Content-Disposition").contains("filename=") && part.getSize() > 0) {
			
			ImgDTO imgDTO = new ImgDTO();
			
			imgDTO.setImgcname(part.getSubmittedFileName());
			imgDTO.setImgsname(sfnList.get(listIndex));
			imgDTO.setImgsize((int) part.getSize());
			imgDTO.setImgnum(listIndex + 1);
			
			boardImgService.writeBoardImg(productNum, imgDTO);
			
			listIndex++;
		}
	}
	
	response.sendRedirect("/Vada/jsp/mainForm.jsp");
%>