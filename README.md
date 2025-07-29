<p align="center">
  <img src="_res/banner.png" alt="BANDBIT Banner">
</p>

<h1 align="center">BANDBIT</h1>

<blockquote>
  <p align="center">A Raccoon-Themed, Racket-Based Discord Bot.</p>
</blockquote>

---

> 🦝 + 🤖

[Bandbit](https://megalisp.github.io/bandbit) is the personal Discord bot for [Megalisp](https://github.com/megalisp) and their community [The Megaplex]() and related communities / projects.  
Use at your own risk — we’re raccoon-dogfooding it, building it primarily to suit our own needs and wants.
 Not really intended for wide / general use (at least at this point in time).


---

## ⚡ Features

Command         | Description
----------------|------------------------------------------
🦝echo [...]     | Echoes back your message
🦝ping           | Replies with "Pong!"
🦝server         | Shows the server name and ID
🦝help           | Lists available commands
🦝avatar         | Shows your profile picture URL
🦝say [...]      | Deletes your message and reposts it as the bot
🦝reverse [...]  | Reverses your message text

---

## 🦾 Getting Started

1.  **Install Racket (8.7 or later recommended):**

>   https://racket-lang.org

2. **Clone the repo:**
```
   git clone https://github.com/megalisp/bandbit
   cd bandbit
```

3. **Install dependencies:**
```
   raco pkg install --auto
```

4. **Set your bot token (use a .env loader or export manually):**
```
   export BOT_TOKEN="your_discord_bot_token"
```

5. **Run the bot:**
```
   racket main.rkt
```

---

## 🔧 Environment Variables

Variable    | Description
------------|--------------------------
BOT_TOKEN   | Your Discord bot token

---

## 🗺️ Roadmap

...

---

## 📜 License

MIT / Apache-2.0

---

## 💡 Acknowledgments

- Powered by the great [racket-cord](https://docs.racket-lang.org/racket-cord/index.html)
