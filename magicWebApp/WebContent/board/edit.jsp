<%@page import="magic.board.BoardBean"%>
<%@page import="magic.board.BoardDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	int b_id = Integer.parseInt(request.getParameter("b_id"));
	BoardDBBean db = BoardDBBean.getInstace();
//	BoardBean board = db.getBoard(b_id, flase);
	BoardBean board = db.getBoard(b_id, false);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script type="text/javascript" src="board2.js" charset="utf-8"></script>
</head>
<body>
    <center>
        <h1>�� �� �� �� ��</h1>
        <form name="boardWrite" method="post" action="edit_ok.jsp?b_id=<%= b_id %>">
            <table>
                <tr height="30">
                    <td width="80">�ۼ���</td>
                    <td width="140">
                        <input type="text" name="b_name" maxlength="20" size="20" value="<%=  board.getB_name()%>">
                    </td>
                    <td width="80">�̸���</td>
                    <td width="140">
                        <input type="text" name="b_email" maxlength="20" size="20" value="<%= board.getB_email()%>">
                    </td>
                </tr>
                <tr heigth="30">
                    <td width="80">������</td>
                    <td colspan="3">
                        <input type="text" name="b_title" maxlength="80" size="80" value="<%= board.getB_title()%>">
                    </td>
                </tr>
                <tr>
                   <td colspan="4">
                       <textarea name="b_content" rows="10" cols="65">
                           <%= board.getB_content()%>
                       </textarea>
                   </td>
                </tr>
                <tr>
                    <td width="80">�� ȣ</td>
                    <td colspan="3">
                        <input type="password" name="b_pwd" maxlength="12" size="12">
                    </td>
                </tr>
                <tr heigth="50" align="center">
                    <td colspan="4">
                        <input type="button" value="�ۼ���" onclick="check_ok()">
                        <input type="reset" value="�ٽ��ۼ�">
                        <input type="button" value="�۸��" onclick="location.href='list.jsp'">
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>