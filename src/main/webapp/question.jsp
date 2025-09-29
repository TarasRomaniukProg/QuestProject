<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.*"%>
<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Question</title>
  <link rel="stylesheet" href="styles/question.css" type="text/css">
</head>
<body>

<div class="button-container">
  <h1><%
    String question = (String) request.getAttribute("questionName");
    out.println(question);
  %></h1>
  <form action="hello-servlet" method="get">
    <button type="submit" name="opt1" class="btn">
      <%
        String opt1Txt = (String)request.getAttribute("opt1");
        out.println(opt1Txt);
      %>
    </button>
    <button type="submit" name="opt2" class="btn">
      <%
        String opt2Txt = (String)request.getAttribute("opt2");
        out.println(opt2Txt);%>
    </button>
  </form>

</div>

</body>
</html>
