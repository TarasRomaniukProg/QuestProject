<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import = "java.util.*"%>
<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Question</title>
  <style>
    body {
      margin: 0;
      font-family: "Cinzel", serif;
      background: radial-gradient(circle at center, #0f0f0f, #1a1a1a, #000000);
      color: #f0f0f0;
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }

    .button-container {
      background: rgba(20, 20, 20, 0.85);
      padding: 40px 60px;
      border-radius: 20px;
      box-shadow: 0 0 25px rgba(255, 0, 0, 0.3),
      inset 0 0 15px rgba(255, 0, 0, 0.2);
      text-align: center;
      max-width: 600px;
    }

    h1 {
      font-size: 2em;
      margin-bottom: 30px;
      text-shadow: 0 0 15px #ff0000, 0 0 30px #660000;
    }

    .btn {
      background: #330000;
      color: #fff;
      border: none;
      padding: 15px 30px;
      margin: 10px;
      border-radius: 12px;
      font-size: 1.2em;
      cursor: pointer;
      box-shadow: 0 0 10px rgba(255, 0, 0, 0.4);
      transition: transform 0.2s, box-shadow 0.3s;
    }

    .btn:hover {
      transform: scale(1.08);
      box-shadow: 0 0 25px rgba(255, 0, 0, 0.7);
      background: #550000;
    }
  </style>
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
        out.println(opt2Txt);
      %>
    </button>
  </form>
</div>

</body>
</html>
