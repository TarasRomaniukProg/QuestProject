<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 26.09.2025
  Time: 17:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Winner page</title>
    <style>
        body {
            margin: 0;
            font-family: "Cinzel", serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: radial-gradient(circle at center, #0f2027, #203a43, #2c5364);
            color: #f0f0f0;
            overflow: hidden;
        }

        .card {
            background: rgba(20, 20, 40, 0.85);
            padding: 50px 70px;
            border-radius: 25px;
            box-shadow: 0 0 30px rgba(0, 255, 200, 0.5), 0 0 60px rgba(0, 150, 255, 0.3);
            text-align: center;
            position: relative;
            border: 2px solid rgba(0, 200, 255, 0.4);
            z-index: 10;
        }

        h1 {
            font-size: 3em;
            color: #00f7ff;
            text-shadow: 0 0 15px #00f7ff, 0 0 30px #00c3ff;
            margin-bottom: 20px;
        }

        p {
            font-size: 1.3em;
            color: #a0faff;
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
            background: linear-gradient(145deg, #003366, #00c3ff);
            border: 2px solid rgba(0, 200, 255, 0.6);
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 200, 255, 0.7), inset 0 0 10px rgba(0, 100, 200, 0.6);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .btn:hover {
            background: linear-gradient(145deg, #00c3ff, #003366);
            box-shadow: 0 0 25px rgba(0, 255, 255, 1), inset 0 0 15px rgba(0, 150, 255, 0.8);
            transform: scale(1.05);
        }

        /* Магічні іскри */
        .sparkle {
            position: absolute;
            width: 6px;
            height: 6px;
            background: #00f7ff;
            border-radius: 50%;
            box-shadow: 0 0 15px #00f7ff, 0 0 30px #00c3ff;
            animation: float 6s linear infinite;
        }

        @keyframes float {
            from {
                transform: translateY(0) scale(1);
                opacity: 1;
            }
            to {
                transform: translateY(-120vh) scale(0.5);
                opacity: 0;
            }
        }

        /* Конфеті-вибух */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            opacity: 0.9;
            border-radius: 2px;
            animation: explode 2s ease-out forwards;
        }

        @keyframes explode {
            from {
                transform: translate(0, 0) scale(1);
                opacity: 1;
            }
            to {
                transform: translate(var(--x), var(--y)) scale(0.5) rotate(1080deg);
                opacity: 0;
            }
        }
    </style>
</head>
<body>

<div class="card">
    <h1>Вітаємо, Мандрівнику!</h1>
    <p>Ви здолали магічний лабіринт 🔮</p>
    <a href="hello-servlet" class="btn" onclick=<%
        HttpSession session1 = request.getSession();
        session1.setAttribute("questionId", "1");
        session1.setAttribute("counter", (Integer.parseInt((String) session1.getAttribute("counter")) + 1) + "");
    %>>Грати ще</a>
</div>

<script>
    // Магічні іскри
    for (let i = 0; i < 60; i++) {
        let sparkle = document.createElement("div");
        sparkle.className = "sparkle";
        sparkle.style.left = Math.random() * 100 + "vw";
        sparkle.style.top = Math.random() * 100 + "vh";
        sparkle.style.animationDuration = 4 + Math.random() * 6 + "s";
        sparkle.style.backgroundColor =
            ["#00f7ff", "#9d4edd", "#ff6ec7"][Math.floor(Math.random() * 3)];
        document.body.appendChild(sparkle);
    }

    // Великий конфеті-вибух
    function confettiExplosion(x, y) {
        for (let i = 0; i < 200; i++) {
            let confetti = document.createElement("div");
            confetti.className = "confetti";
            confetti.style.left = x + "px";
            confetti.style.top = y + "px";
            confetti.style.backgroundColor =
                ["#ff4081", "#3f51b5", "#4caf50", "#ffeb3b", "#9c27b0"][Math.floor(Math.random() * 5)];

            let angle = Math.random() * 2 * Math.PI;
            let distance = 200 + Math.random() * 400;
            let dx = Math.cos(angle) * distance;
            let dy = Math.sin(angle) * distance;

            confetti.style.setProperty("--x", dx + "px");
            confetti.style.setProperty("--y", dy + "px");

            document.body.appendChild(confetti);
            setTimeout(() => confetti.remove(), 2500);
        }
    }

    window.onload = () => {
        let centerX = window.innerWidth / 2;
        let centerY = window.innerHeight / 2;
        confettiExplosion(centerX, centerY);
    };
</script>

</body>
</html>
