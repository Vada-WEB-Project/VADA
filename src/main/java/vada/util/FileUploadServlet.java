package vada.util;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.catalina.connector.Request;
import org.apache.commons.lang3.RandomStringUtils;

import vada.constants.CommonConstants;
import vada.dao.impl.BoardImgListDAOImpl;
import vada.dto.ImgDTO;
import vada.service.BoardImgService;

public class FileUploadServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 14357642724634526L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	} // doGet

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		
		String command = req.getParameter("command"); 
		System.out.println("servl===========>" + req.getParameter("productnum"));
		if (command.equals("write")) {
			process(req, resp, "/jsp/boardWriteProc.jsp");
		} 
		else if(command.equals("notifyWrite")) {
			process(req, resp,"/jsp/notifyWriteProc.jsp");
		}
//		else if (command.equals("update")) {
//			BoardImgService boardImgService = new BoardImgListDAOImpl();
//			List<ImgDTO> imgDTOList = null;
//			try {
//				imgDTOList = boardImgService.listBoardImg(Integer.parseInt(req.getParameter("userid")));
//				for (ImgDTO imgDTO : imgDTOList) {
//					File sfnFile = new File(imgDTO.getImgsname());
//					if (sfnFile.exists())
//						sfnFile.delete();
//				}
//			} catch (Exception ex) {
//				ex.printStackTrace();
//			}
//			
//			process(req, resp, "/boardupdateproc.do");
//		} // else if
		
	} // doPost

	private void process(HttpServletRequest req, HttpServletResponse resp, String dispatchURI) {
	
		try {
			Collection<Part> parts = req.getParts();
			List<String> sfnList = new ArrayList<String>();
			List<String> contenttypeList = new ArrayList<String>();
			for (Part part : parts) {

				if (part.getHeader("Content-Disposition").contains("filename=") && part.getSize() > 0) {

					File uploadDir = new File(CommonConstants.props.getProperty("FILE_UPLOAD_DIR")
							+ new SimpleDateFormat("yyyyMMdd").format(new Date(System.currentTimeMillis())));
					System.out.println(CommonConstants.props.getProperty("FILE_UPLOAD_DIR"));
					
					if (!uploadDir.exists())
						uploadDir.mkdir();

					String uploadFileName = "";
					uploadFileName = uploadDir.getPath() + "/" + RandomStringUtils.random(100, true, true);

					sfnList.add(uploadFileName);

					part.write(uploadFileName);
					part.delete();

				} // outter if

			} // for

			req.setAttribute("sfnList", sfnList);

//			product = request
//			private name  = sfnList
//			private type  = contenttype
			
			RequestDispatcher dispatcher = req.getRequestDispatcher(dispatchURI);
			dispatcher.forward(req, resp);

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		
	} // process

} // class
