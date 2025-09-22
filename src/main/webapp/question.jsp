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
  <p><%
    String question = (String) request.getAttribute("questionName");
    out.println(question);
  %></p>
  <button class="btn">Піти в ліво</button>
  <button class="btn">Піти в право</button>
</div>

</body>
</html>
