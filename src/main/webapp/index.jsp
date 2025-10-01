<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="uk">
<head>
  <meta charset="UTF-8">
  <title>Головна сторінка</title>
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
      justify-content: flex-start;
      overflow-x: hidden;
      position: relative;
    }

    /* Туман */
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
      padding: 30px 0;
      font-family: "Creepster", cursive;
      font-size: 2.5em;
      color: #ff3b3b;
      text-shadow: 0 0 15px #ff0000, 0 0 30px #660000;
      z-index: 2;
      position: relative;
    }

    .container {
      background: rgba(20, 20, 20, 0.85);
      padding: 40px 60px;
      margin: 20px;
      border-radius: 20px;
      box-shadow: 0 0 30px rgba(255, 0, 0, 0.3),
      inset 0 0 15px rgba(255, 0, 0, 0.2);
      max-width: 800px;
      z-index: 2;
      position: relative;
    }

    h1 {
      color: #ffaaaa;
      text-shadow: 0 0 10px #660000;
    }

    h3 {
      margin-top: 20px;
      color: #ffdddd;
    }

    p {
      line-height: 1.6;
      margin-bottom: 15px;
    }

    .btn {
      display: inline-block;
      background: #330000;
      color: #fff;
      padding: 15px 40px;
      font-size: 1.3em;
      border-radius: 12px;
      text-decoration: none;
      margin-top: 20px;
      box-shadow: 0 0 15px rgba(255, 0, 0, 0.4);
      transition: transform 0.2s, box-shadow 0.3s;
    }

    .btn:hover {
      transform: scale(1.1);
      box-shadow: 0 0 30px rgba(255, 0, 0, 0.7);
      background: #550000;
    }
  </style>
</head>
<body>

<div class="fog"></div>

<header>
  <h2>Лабіринт спогадів</h2>
</header>

<div class="container">
  <h1>Сюжет гри:</h1>
  <h3>Українською:</h3>
  <p>
    Ти прокидаєшся у темному стародавньому підземеллі. Кам’яні стіни оточують тебе, а слабке світло факелів кидає довгі тіні. Пам’ять тьмяна, як далека зірка, але всередині відчуваєш, що колись ти був важливою людиною — можливо, володарем, воїном або магом великої сили.
    Повітря наповнене запахом старовини та вогкості, а глухий стукіт твого серця здається єдиним звуком у цьому мовчазному лабіринті. Перед тобою — численні коридори, кожен із яких приховує небезпеки та таємниці. Легенди кажуть, що ті, хто проходить цей лабіринт, отримують свободу, але помилка може приректи на вічне забуття.
    Кожен вибір важливий. Кожен крок — перевірка твоєї відваги та мудрості. Зустрічі з тінями минулого, стародавні головоломки, пастки, що випробовують твою уважність — все це випробовує твою здатність вижити та знайти правду.
    Чи зможеш ти відновити пам’ять, розкрити таємниці підземелля та здобути свободу? Чи твоє ім’я назавжди загубиться у темряві? Лабіринт чекає, а час невпинно тече…
  </p>

  <h3>English:</h3>
  <p>
    You awaken in a dark, ancient dungeon. Stone walls surround you, and the dim light of torches casts long, flickering shadows. Your memory is clouded, like a distant star, yet deep inside, you sense that you were once someone important — perhaps a ruler, a warrior, or a mage of great power.
    The air smells of age and dampness, and the dull echo of your heartbeat seems the only sound in this silent labyrinth. Before you lie countless corridors, each hiding dangers and secrets. Legends speak of those who navigate this maze — freedom awaits, but a single mistake could condemn you to eternal oblivion.
    Every choice matters. Every step tests your courage and wisdom. Encounters with shadows of the past, ancient puzzles, and traps that challenge your attention — all of this tests your ability to survive and uncover the truth.
    Will you restore your memory, unravel the secrets of the dungeon, and claim freedom? Or will your name be lost forever in the darkness? The labyrinth awaits, and time is slipping away…
  </p>

  <a href="loginPage.jsp" class="btn">Увійти в лабіринт</a>
</div>

</body>
</html>
