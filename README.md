<div align="center">

# 🖥️ Remote Desktop Control

### Spin up a fully configured Windows VM inside GitHub Actions — remotely accessible in minutes.

[![GitHub Actions](https://img.shields.io/badge/Powered%20by-GitHub%20Actions-2088FF?style=for-the-badge&logo=github-actions&logoColor=white)](https://github.com/features/actions)
[![Platform](https://img.shields.io/badge/Platform-Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/matrixlolz/Remote-desktop-control)
[![Python](https://img.shields.io/badge/Python-3.x-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://python.org)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

<br/>

> **Free Windows VM. Remote access. Zero local setup.**  
> Uses GitHub's own infrastructure to run a full Windows environment you can connect to via LiteManager or AnyDesk — for free.

</div>

---

## 🚀 What Is This?

This repo automates the entire process of spinning up a **Windows virtual machine inside a GitHub Actions runner** and making it remotely accessible via **LiteManager Pro** and **AnyDesk**.

No paid VPS. No local VM software. Just push the workflow, wait a few minutes, and you're connected to a live Windows desktop.

```
GitHub Actions Runner (Windows)
        │
        ├── Downloads & installs LiteManager Pro (unattended)
        ├── Auto-configures GUI via PyAutoGUI
        ├── Retrieves your LiteManager ID automatically
        ├── Sets a static password
        ├── Starts a keep-alive loop to prevent timeout
        └── Outputs credentials → you connect remotely
```

---

## ✨ Features

| Feature | Description |
|---|---|
| 🤖 **Fully Automated Setup** | PyAutoGUI clicks through the entire GUI installer — no human interaction needed |
| 🔑 **Auto ID Retrieval** | LiteManager ID is grabbed from clipboard and saved to `show.bat` automatically |
| 🔁 **Keep-Alive Monitor** | `loop.py` prevents GitHub Actions from timing out by monitoring and managing processes |
| 📊 **CPU Logger** | Logs high-CPU processes to a named log file for debugging |
| 💻 **Pre-configured Tools** | `Downloads.bat` handles all tool downloads in one shot |
| 🛡️ **Static Password** | LiteManager password is set and echoed to output for quick reference |
| 📋 **Credential Dump** | `show.bat` auto-appends your LiteManager ID + password after setup |

---

## 📁 File Structure

```
Remote-desktop-control/
│
├── 📂 yml/                  # GitHub Actions workflow files
│
├── 🐍 setup.py              # Core automation — installs & configures LiteManager via PyAutoGUI
├── 🐍 loop.py               # Keep-alive monitor — watches CPU, kills stuck processes, logs usage
│
├── 🦇 Downloads.bat         # Downloads all required tools/installers
├── 🦇 loop.bat              # Batch keep-alive script
├── 🦇 show.bat              # Output file — stores your LiteManager ID + password
│
├── 📄 .gitignore
├── 📄 LICENSE               # MIT
└── 📄 README.md
```

---

## ⚙️ How It Works

### Step 1 — Trigger the Workflow
Push to `main` or manually trigger the GitHub Actions workflow from the **Actions** tab.

### Step 2 — Windows Runner Boots
GitHub spins up a fresh Windows runner. The workflow installs Python dependencies and kicks off the scripts.

### Step 3 — LiteManager Auto-Install (`setup.py`)
PyAutoGUI drives the LiteManager Pro installer silently:
- Clicks through all install dialogs
- Sets the remote access password
- Starts the ROMServer process
- Opens LiteManager and retrieves your unique **Node ID**

### Step 4 — Credentials Saved
Your **LiteManager ID** and **password** are written to `show.bat`, then echoed in the Actions log so you can read them immediately.

### Step 5 — Keep-Alive Loop (`loop.py`)
A background monitor runs continuously:
- Watches for the `CTFarm.exe` process and terminates it if found
- Logs any process exceeding **50% CPU** to a host-named `.txt` file
- Sleeps 10s between checks — keeping the runner alive without burning CPU

### Step 6 — Connect
Open **LiteManager** on your local machine, enter the Node ID + password, and you're in.

---

## 🛠️ Setup & Usage

### Prerequisites
- A GitHub account (free tier works)
- LiteManager Pro installed locally (for connecting)
- That's it

### Quick Start

1. **Fork or clone this repo**
   ```bash
   git clone https://github.com/matrixlolz/Remote-desktop-control.git
   cd Remote-desktop-control
   ```

2. **Trigger the workflow**
   - Go to your repo on GitHub
   - Click **Actions** → select the workflow → **Run workflow**

3. **Watch the logs**
   - Open the running job
   - Wait for setup to complete (~3-5 min)
   - Find your credentials in the job output under `show.bat` echo

4. **Connect via LiteManager**
   - Open LiteManager Pro on your machine
   - Enter the **Node ID** from the logs
   - Password: `iblamematrix` (default, set in `setup.py`)
   - You're in 🎉

---

## 🔧 Configuration

### Change the Password
In `setup.py`, update this line:
```python
password = "IblameM4trix"
```

### Change the Keep-Alive Timeout
In `loop.py`, adjust the sleep interval:
```python
time.sleep(10)  # seconds between checks
```

### Change CPU Threshold for Logging
```python
threshold_percentage = 50  # percent
```

### Add/Remove Monitored Processes
```python
included_processes = ['CTFarm.exe']  # add more process names here
```

---

## 📦 Dependencies

The scripts use the following Python packages:

```
pyautogui
pyperclip
psutil
subprocess (stdlib)
socket (stdlib)
time (stdlib)
```

Install manually if running locally:
```bash
pip install pyautogui pyperclip psutil
```

---

## ⚠️ Limitations & Notes

- **GitHub Actions timeout** — Free tier runners have a 6-hour job limit. The keep-alive loop helps but won't exceed GitHub's hard cap.
- **Resolution** — The runner desktop runs at a default resolution. You can change it via workflow steps if needed.
- **Single session** — One connection at a time via LiteManager free tier.
- **Ephemeral** — The VM is destroyed when the workflow ends. Save anything important before it times out.
- **For educational/personal use** — Don't abuse GitHub's free compute. Be a human about it.

---

## 🤝 Contributing

PRs welcome. If you've got improvements — better keep-alive logic, AnyDesk auto-config, multi-session support — open a pull request.

1. Fork the repo
2. Create your branch (`git checkout -b feature/cool-thing`)
3. Commit your changes (`git commit -m 'add cool thing'`)
4. Push and open a PR

---

## 📜 License

MIT — do whatever you want, just don't blame me.

---

<div align="center">

**Built by [matrixlolz](https://github.com/matrixlolz)**

*Free Windows VMs living rent-free on GitHub's servers.*

</div>
