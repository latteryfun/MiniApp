# MiniApp
Lattery is a Web3 utility hub where meme token creators launch fair, on-chain games, lotteries, and NFT battles to engage their communities. you can test this app on https://t.me/latteryfunbot?start=1

# 🎲 Blockchain Lottery MiniApp

Telegram miniapp for transparent and decentralized lottery on the blockchain.
This repo contains **application logic**, **winner selection models** and **part of the UI source code** of the miniapp.

---

## ✨ About the project

This project shows how to build a blockchain-based lottery that:

* Its results are transparent and immutable.
* The winner selection process is done via **SQL Server models + Smart Contracts**.
* Its user interface is accessible via **Telegram MiniApp UI**.
* The technology used is ASP.NET Core 9

---

## 🧩 System Architecture

```mermaid
flowchart TD
User[Telegram User] --> MiniApp[MiniApp UI]
MiniApp --> Backend[Application Logic]
Backend --> SQL[(SQL Server Models)]
Backend --> MiniApp Functions
Blockchain --> Blockchain[(Smart Contracts)]
Backend --> MiniApp
UI --> MiniApp UI
```

---

## 📂 Repo Structure

```
/lattery-miniapp
├── ui/ # MiniApp UI Source (React / Telegram SDK)
├── backend/ # Application Logic (API + Blockchain Connection)
├── Blockchain / # Smart Contracts (Func)
├── UI/ # MiniApp
├── docs/ # Diagrams and Explanations
└── README.md
```

---

## 🎮 User Interface (UI)
MiniApp UI includes The following sections are:

* Ticket Purchase Page
* Draw Timer Display
* Results and Winners Display

📸 UI Sample:

<img src="docs/img/intro.png?raw=true" alt="UI Screenshot" width="300"/>
<img src="docs/img/Dashboard.png?raw=true" alt="UI Screenshot" width="300"/>
<img src="docs/img/Tasks.png?raw=true" alt="UI Screenshot" width="300"/>
<img src="docs/img/Buy.png?raw=true" alt="UI Screenshot" width="300"/>
<img src="docs/img/Random.png?raw=true" alt="UI Screenshot" width="300"/>
<img src="docs/img/Transactions.png?raw=true" alt="UI Screenshot" width="300"/>


