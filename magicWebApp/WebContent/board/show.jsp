<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String pageNum = request.getParameter("pageNum");
	int bid = Integer.parseInt(request.getParameter("b_id"));

	BoardDBBean db = BoardDBBean.getInstance();
	//BoardBean board = db.getBoard(bid);
	BoardBean board = db.getBoard(bid, true);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	int b_id=0, b_hit=0, b_fsize=0;
	String b_name="", b_email="", b_title="", b_content="", b_fname="";
	Timestamp b_date=null;
	
	b_id = board.getB_id();
	b_name = board.getB_name();
	b_email = board.getB_email();
	b_title = board.getB_title();
	b_content = board.getB_content();
	b_date = board.getB_date();
	b_hit = board.getB_hit();
	b_fname = board.getB_fname();
	b_fsize = board.getB_fsize();
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>글 내 용 보 기</h1>
		<table border="1" width="800" cellspacing="0">
			<tr height="30" align="center">
				<td width="100">
					글번호
				</td>
				<td width="200">
					<%= b_id %>
				</td>
				<td width="100">
					조회수
				</td>
				<td width="200">
					<%= b_hit %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="100">
					작성자
				</td>
				<td width="200">
					<%= b_name %>
				</td>
				<td width="100">
					작성일
				</td>
				<td width="200">
					<%= sdf.format(b_date) %>
				</td>
			</tr>
			<tr height="30" align="center">
				<td width="110">파&nbsp;&nbsp;일</td>
				<td colspan="3">
				<%-- 
					&nbsp;
					<%
						if(b_fname != null){
					%>
							<img src="../images/zip.gif">
							<a href="../upload/<%= b_fname %>">원본파일 : <%= b_fname %> (<%= b_fsize %>)</a>
					<%
						}
					%>
				--%>
				<%
					out.println("<p>첨부파일"+"<a href='FileDownload.jsp?fileN="+b_id+"'>"+b_fname+"</a></p>");
				%>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					글제목
				</td>
				<td colspan="3" width="100">
					<%= b_title %>
				</td>
			</tr>
			<tr height="30">
				<td width="100" align="center">
					글내용
				</td>
				<td colspan="3" width="100">
					<pre>
						<%= b_content %>
					</pre>
				</td>
			</tr>
			<tr height="30">
				<td colspan="4" align="right">
					<input type="button" value="글수정" onclick="location.href='edit.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="글삭제" onclick="location.href='delete.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="답변글" onclick="location.href='write.jsp?b_id=<%= b_id %>&pageNum=<%= pageNum %>'">
					<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%= pageNum %>'">
				</td>
			</tr>
		</table>
	</center>
</body>
</html>








