<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="vada.dto.NotifyimgDTO"%>
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

<jsp:useBean id="notifyDTO" class="vada.dto.NotifylistDTO" />
<jsp:setProperty name="notifyDTO" property="notifyreason" />

<%
	BoardWriteService notifyWriteService = new BoardWriteDAOImpl();
	String userid = "testid"; //아이디 값 세션에서 받아와야함 user 테이블 데이터값이랑 일단 맞춰주고 테스트 진행
	
	int notifyProductNum = Integer.parseInt(request.getParameter("productnum")); // 게시물 ID 얻기
	
	int notifyid = notifyWriteService.notifyWriteBoard(notifyDTO, notifyProductNum, userid); // 신고 DB 작성하면서 notifyid 값 얻어오기 (이미지DB저장시 사용)
	// DB 바꿔야함 notifyimgnum 만 pri key + auto_increment
	
	BoardImgService notifyImgService = new BoardImgWriteDAOImpl();
	Collection<Part> parts = null;
	try {
		parts = request.getParts();
	} catch (Exception ex) {
	
	}
	
	// 신고 첨부파일 파일 처리
	List<String> sfnList = (List<String>) request.getAttribute("sfnList");
	int listIndex = 0;
	for (Part part : parts) {
		if (part.getHeader("Content-Disposition").contains("filename=") && part.getSize() > 0) {
			NotifyimgDTO notifyImgDTO = new NotifyimgDTO();
			notifyImgDTO.setNotifyimgcname(part.getSubmittedFileName());
			notifyImgDTO.setNotifyimgsname(sfnList.get(listIndex));
			notifyImgDTO.setNotifyimgnum(listIndex + 1);
			notifyImgDTO.setNotifyimgsize((int) part.getSize());
			try {
		notifyImgService.notifyWriteBoardImg(notifyid, notifyImgDTO);
			} catch (Exception ex) {
		ex.printStackTrace();
			}
			listIndex++;
		}
	}
	response.sendRedirect("/Vada/jsp/mainForm.jsp"); // 디테일 폼으로 넘겨주기
%>