<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,
				com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.util.*, java.io.*" %>
<%@ page import="portfolio1.*" %>
<% 
	request.setCharacterEncoding("utf-8");
	String saveFolder = "C:/Users/gci91/eclipse-workspace/portfolio1/src/main/webapp/fileupload";
	String encType = "utf-8";
	int maxSize = 100*1024*1024;


	
	String user = (String)session.getAttribute("id");
	String title = "";
	String content = "";
	String Filename = "";
	int menu_type = 1;
	
	
	try{
		MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encType, new DefaultFileRenamePolicy());

		title = multi.getParameter("title");
		content = multi.getParameter("content");
		menu_type = Integer.parseInt(multi.getParameter("menu_type"));
		
		File dir = new File(saveFolder+"/");
		String dbFiles = "";
		int totalSize = 0;
		
		
		if(multi.getParameter("file_list") != null && !multi.getParameter("file_list").equals("")){
			String[] fileList = multi.getParameter("file_list").split(",");
			for(int i = 0; i < fileList.length; i++){
					
				int idx = fileList[i].lastIndexOf(".");
				String pattern = fileList[i].substring(0, idx);
				

				FilenameFilter filter = new FilenameFilter(){
					public boolean accept(File f, String name){
						return name.startsWith(pattern);
					}
				};
				
				
				File files[] = dir.listFiles(filter);

				int sel = 0;
				if(files.length > 1)
					sel = files.length - 1;
				dbFiles += files[sel].getName()+",";
				totalSize += files[sel].length();
			}	
		}
		
		
		
		PortMgr pMgr = new PortMgr();
		int res = pMgr.insertBoard(user, title, content, dbFiles, totalSize, menu_type);
		if(res <= 0){
			out.println("<script>alert('게시글 작성에 실패하였습니다.'); history.back();</script>");
		}else{
			response.sendRedirect("index.jsp");	
		}
	}catch(IOException ioe){
		System.out.println(ioe);
	}catch(Exception ex){
		System.out.println(ex);
	}
%>
