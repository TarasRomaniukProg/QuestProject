<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8">
    <title>Логін - Лабіринт спогадів</title>
    <link href="https://fonts.googleapis.com/css2?family=Creepster&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: "Cinzel", serif;
            background: #000;
            color: #f0f0f0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .fog {
            position: absolute;
            top: 0; left: 0;
            width: 200%;
            height: 200%;
            background: url("https://images.unsplash.com/photo-1505489304214-8f91c5b4b307?auto=format&fit=crop&w=1920&q=80") repeat;
            background-size: cover;
            opacity: 0.15;
            animation: drift 120s linear infinite;
            z-index: 1;
        }

        @keyframes drift {
            from { transform: translateX(0) translateY(0); }
            to { transform: translateX(-500px) translateY(-200px); }
        }

        header {
            text-align: center;
            font-family: "Creepster", cursive;
            font-size: 2.5em;
            color: #ff3b3b;
            text-shadow: 0 0 15px #ff0000, 0 0 30px #660000;
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }

        .login-container {
            background: rgba(20, 20, 20, 0.85);
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 0 30px rgba(255, 0, 0, 0.3),
            inset 0 0 15px rgba(255, 0, 0, 0.2);
            position: relative;
            z-index: 2;
            max-width: 400px;
            width: 90%;
            text-align: center;
        }

        .login-container h1 {
            color: #ffaaaa;
            text-shadow: 0 0 10px #660000;
            margin-bottom: 30px;
        }

        .login-container label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-size: 1.1em;
            color: #ffdddd;
        }

        .login-container input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 8px;
            border: none;
            font-size: 1em;
        }

        .login-container input[type="submit"] {
            background: #330000;
            color: #fff;
            padding: 15px 40px;
            font-size: 1.3em;
            border-radius: 12px;
            text-decoration: none;
            cursor: pointer;
            box-shadow: 0 0 15px rgba(255, 0, 0, 0.4);
            transition: transform 0.2s, box-shadow 0.3s, background 0.3s;
        }

        .login-container input[type="submit"]:hover {
            transform: scale(1.1);
            box-shadow: 0 0 30px rgba(255, 0, 0, 0.7);
            background: #550000;
        }

        .login-container p {
            margin-top: 20px;
            color: #ffdddd;
            font-size: 0.9em;
        }
    </style>
</head>
<body>

<div class="fog"></div>

<header>Лабіринт спогадів</header>

<div class="login-container">
    <h1>Увійти</h1>
    <form action="login-servlet">
        <label for="username">Ім'я користувача:</label>
        <input type="text" id="username" name="username" required>

        <input type="submit" value="Вхід"/>
    </form>
    <p>Ще не маєте облікового запису? Зв'яжіться з адміністратором.</p>
</div>

</body>
</html>
