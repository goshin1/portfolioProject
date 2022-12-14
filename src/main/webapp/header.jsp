<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="portfolio1.*" %>
<header>
        <div id="over">
            <a id="logo" href="./index.jsp">
                <img src="imgs/logo.png" alt="logo">
            </a>

            <form id="search_box" name="search_box" method="get" action="index.jsp">
                <input name="search" placeholder="search..  ">
            </form>

            <div id="colorChange">
                <div id="change"></div>
            </div>

			<% 
			
			   String id = "";
			   if((String)session.getAttribute("id") != null)
				   id = (String)session.getAttribute("id");
			   if(id == null || id.equals("")){ %>
            <a id="login" href="./login.jsp">login</a>
            <% } else { %>
            <a id="login" href="./logout.jsp">logout</a>
            <%} %>
            
        </div>
        <div id="under">
            <ul id="menu">
                <li class="submenu">
                    <a href="index.jsp?menu_type=1">게시판</a>
                </li>
                <li class="submenu">
                    <a href="index.jsp?menu_type=2">경험나눔</a>
                </li>
                <li class="submenu">
                    <a href="jobs.jsp">채용정보</a>
                </li>
                <li class="submenu">
                    <a href="index.jsp?menu_type=3">Q&A</a>
                </li>
                <li class="submenu">
                    <a href="index.jsp?menu_type=4">공지사항</a>
                </li>

            	<%
            		PortMgr pMgr2 = new PortMgr();
            		if(pMgr2.checkManager(id)){
            	%>
                <li class="submenu">
                    <a href="manager.jsp">관리</a>
                </li>
                <%} %>
            </ul>
        </div>
    </header>