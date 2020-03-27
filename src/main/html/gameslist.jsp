<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="launch.Manager" %>
<%@ page import="user.User" %>
<html lang="en">
<link rel="stylesheet" type="text/css" href="tab.css" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<div>
    <a href="/">
    <button type="button">
        Disconnect
    </button>
    </a>
    <a href="/playerslist">
    <button type="button" style="float: right;">
        Players
    </button>
    </a>
    <a href="/onsessions">
    <button type="button" style="float: right;">
        Sessions
    </button>
    </a>
</div>
<body>

    <% User user = Manager.getCurrentUser();
        if (user == null)
            response.sendRedirect("/index.jsp?cred=1");
        else if (user.getStatus() == 1)
            response.sendRedirect("/index.jsp?cred=1");
        else if (user.getStatus() == 2)
            response.sendRedirect("/index.jsp?cred=2"); %>

    <div id="boxdiv" style="width: 35%; text-align: center;">
        <br><br><br>
        <h1 align="center">Game list</h1>
        <br>
        <form action="/gameslist" method="post">
            <button id="addelete" name="addelete" value="add">Add</button>
            <button id="addelete" name="addelete" value="delete">Delete</button>
            <br><br>
            <div align="center">
                <% String data = request.getParameter("data");
                List<String> games = Arrays.asList(data.split(";"));%>
                <table border="1px solid black">
                    <tr border="1px solid black">
                        <th width="50%">Game</th>
                        <th width="50%">Number of players</th>
                    </tr>
                    <tr>
                        <th width="50%"><input type="text" name="newgame"></th>
                        <th width="50%"></th>
                        <th></th>
                    </tr>
                    <% for (int i=0 ; i<games.size() ; i+=2){ %>
                    <tr>
                        <td> <%= games.get(i) %> </td>
                        <td> <%= games.get(i+1) %> </td>
                        <td> <input type="checkbox" name="checkbox" value="<%=i%>"> </td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </form>
    </div>
</body>

</html>