<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26.09.2025
  Time: 17:39
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The end</title>
    <style>
        body {
            margin: 0;
            font-family: "Cinzel", serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #000;
            color: #f8d7da;
            overflow: hidden;
            position: relative;
        }

        .card {
            background: rgba(30, 0, 0, 0.85);
            padding: 50px 70px;
            border-radius: 25px;
            box-shadow: 0 0 40px rgba(255, 0, 0, 0.4), inset 0 0 20px rgba(255, 0, 0, 0.2);
            text-align: center;
            position: relative;
            border: 2px solid rgba(255, 0, 0, 0.3);
            z-index: 20;
        }

        h1 {
            font-size: 3em;
            color: #ff3b3b;
            text-shadow: 0 0 15px #ff0000, 0 0 30px #660000;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.3em;
            color: #ffaaaa;
        }

        /* Стиль кнопки */
        .btn {
            display: inline-block;
            margin-top: 25px;
            padding: 15px 40px;
            font-size: 1.2em;
            font-family: "Cinzel", serif;
            color: #fff;
            text-decoration: none;
            background: linear-gradient(145deg, #660000, #ff3b3b);
            border: 2px solid rgba(255, 0, 0, 0.6);
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.7), inset 0 0 10px rgba(150, 0, 0, 0.6);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn:hover {
            background: linear-gradient(145deg, #ff3b3b, #660000);
            box-shadow: 0 0 25px rgba(255, 50, 50, 1), inset 0 0 15px rgba(200, 0, 0, 0.8);
            transform: scale(1.05);
        }

        /* Тріщини */
        .crack {
            position: absolute;
            width: 2px;
            height: 100px;
            background: radial-gradient(circle, rgba(255,0,0,0.9) 20%, transparent 70%);
            box-shadow: 0 0 25px rgba(255,0,0,0.8);
            transform: rotate(var(--angle));
            animation: flicker 2s infinite alternate;
            z-index: 5;
        }

        @keyframes flicker {
            from { opacity: 0.3; filter: blur(1px); }
            to { opacity: 1; filter: blur(3px); }
        }

        /* Падаючі іскри */
        .ember {
            position: absolute;
            width: 6px;
            height: 6px;
            background: #ff3b3b;
            border-radius: 50%;
            box-shadow: 0 0 10px #ff0000;
            animation: fall 8s linear infinite;
            z-index: 1;
        }

        @keyframes fall {
            from {
                transform: translateY(-10vh) scale(1);
                opacity: 1;
            }
            to {
                transform: translateY(120vh) scale(0.3);
                opacity: 0;
            }
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Гра закінчена</h1>
    <p>Магічний лабіринт поглинув вас...</p>
    <a href="hello-servlet?restart=true" class="btn">Грати ще</a>
</div>

<script>
    // Червоні тріщини
    for (let i = 0; i < 20; i++) {
        let crack = document.createElement("div");
        crack.className = "crack";
        crack.style.left = Math.random() * 100 + "vw";
        crack.style.top = Math.random() * 100 + "vh";
        crack.style.height = 80 + Math.random() * 150 + "px";
        crack.style.setProperty("--angle", (Math.random() * 60 - 30) + "deg");
        document.body.appendChild(crack);
    }

    // Іскри (жарини)
    for (let i = 0; i < 80; i++) {
        let ember = document.createElement("div");
        ember.className = "ember";
        ember.style.left = Math.random() * 100 + "vw";
        ember.style.animationDuration = 4 + Math.random() * 6 + "s";
        document.body.appendChild(ember);
    }
</script>

</body>
</html>
