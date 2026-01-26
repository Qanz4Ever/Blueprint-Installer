# Blueprint Installer for Pterodactyl

────── ⋆⋅☆⋅⋆ ──────

A **fully automated, clean, and security-aware installer** for the  
**Blueprint Framework on Pterodactyl Panel**.

This project is designed for administrators who want a **fast**, **repeatable**,  
and **unattended** way to install Blueprint without manual interaction.

> ✨ Created by **Mfsavana**  
> 🔒 Security-first installer  
> 🚀 Production ready

---

## 📌 Overview

Blueprint is a powerful framework that extends the Pterodactyl Panel.  
This installer simplifies the official installation steps into **one command**,  
while keeping compatibility with the **official Blueprint documentation**.

The script focuses on:
- Clean terminal output
- Automatic environment detection
- Safe re-execution
- Minimal user interaction

---

## ✨ Key Features

╔════════════════════════════════════════════╗

║ • One-line installation                   ║

║ • Auto-detect Node.js (>= 22)              ║

║ • Skips already installed components      ║

║ • Fully unattended (auto y/n prompts)     ║

║ • Clean, colored, aesthetic terminal UI   ║

║ • Built-in delays for readability         ║

║ • Safe to re-run multiple times           ║

║ • Based on official Blueprint commands    ║

╚════════════════════════════════════════════╝

---

## 🧱 Requirements

Before running the installer, make sure you have:

- Ubuntu 20.04 / 22.04 / 24.04
- Pterodactyl Panel already installed
- Root access or a user with sudo privileges
- Active internet connection

---

## 🚀 Installation

### One-Line Installer (Recommended)

```bash
bash <(curl -fsSL YOUR_RAW_SCRIPT_URL)
```

> ⚠️ Always review scripts before running them as root.

---

## 🔍 What the Installer Does

────── ⋆⋅☆⋅⋆ ──────

1. Installs required system packages (curl, wget, unzip, git, etc)
2. Sets the Pterodactyl working directory
3. Downloads the latest Blueprint release from GitHub
4. Extracts Blueprint files safely
5. Checks installed Node.js version
6. Installs Node.js only if the version is incompatible
7. Installs Yarn if it is missing
8. Installs Node dependencies using Yarn
9. Automatically answers installer prompts (y/n)
10. Runs the official `blueprint.sh` installer
11. Displays a final installation summary

---

## 🧠 Design Philosophy

This installer is built with the following principles:

- **Idempotent**: Safe to run multiple times
- **Minimal input**: No manual confirmation required
- **Readable output**: Clear steps with visual separators
- **Security-aware**: Avoids unsafe package conflicts

---

## 🔐 Security Notice

Some files in this repository are intentionally restricted.

Files containing the marker:

```
Protect By Mfsavana
```

are protected under a **secondary license** and are **not open-source**, even though they may be readable.

---

## 📜 Licensing

This repository uses a **dual-license system**.

### 1️⃣ Apache License 2.0 (Primary License)

Most files are licensed under **Apache License 2.0**, allowing:

- Use
- Modification
- Redistribution

See the `LICENSE` file for full terms.

---

### 2️⃣ MFSAVANA SECURITY LICENSE v1.0 (Secondary / Restricted)

Certain sensitive files are licensed under a stricter license.

These include (but are not limited to):

- Installer scripts
- Uninstaller scripts
- Security patches
- Anti-modification systems
- Anti-access controllers

Under this license, the following are **strictly prohibited**:

- Reuploading or redistributing protected files
- Selling or commercially repackaging any part of the project
- Publishing modified versions
- Removing or altering credits, markers, or license notices
- Sharing modified or original versions publicly

These files are **source-available but NOT open-source**.

See `LICENSE-MFSAVANA` for full terms.

---

## ⚠️ Disclaimer

This project is **not affiliated with or endorsed by** the Pterodactyl or Blueprint teams.

Use this installer at your own risk.  
Always ensure you have backups before modifying production systems.

---

## 👤 Author

**Mfsavana**  
GitHub: https://github.com/Qanz4Ever

---

© 2025 Qanz4Ever / Mfsavana — All Rights Reserved.
