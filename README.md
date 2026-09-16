# WinCLI-Mode 🖥️🚀

**WinCLI-Mode** is a lightweight tool designed to temporarily disable the Windows graphical user interface (`explorer.exe`) and boot into a pure command-line interface (CLI) environment, powered by PowerShell and Fullscreen Windows Terminal.
The goal is to free up system resources (specifically RAM and CPU) for heavy workloads, gaming, or simply to achieve a distraction-free workflow.

## 📊 How much RAM does it save?

By replacing the standard Windows shell with a minimalist CLI environment, you can achieve a significant memory footprint reduction. When `explorer.exe` is not running, many of its dependent services (such as the Start Menu, Windows Search, and background system apps) do not start either.

Here is an average resource consumption breakdown:

| Component | Average RAM Usage | State in WinCLI-Mode |
| :--- | :--- | :--- |
| `explorer.exe` (Windows Explorer) | 150 MB - 400+ MB | 🔴 Terminated |
| `StartMenuExperienceHost.exe` | 40 MB - 80 MB | 🔴 Not started |
| `SearchHost.exe` (Windows Search) | 100 MB - 250 MB | 🔴 Not started |
| Widgets, system tray, 3rd party tools | 100 MB - 300+ MB | 🔴 Not started |
| **Windows Terminal + PowerShell** | 60 MB - 120 MB | 🟢 Active |

**💡 Total estimated savings:** Ranging from **300 MB up to over 1 GB** of RAM on systems with heavy startup software. Moreover, idle CPU usage drops drastically due to the lack of GUI animations, background indexing, and updating widgets.

## ⚙️ Prerequisites

To ensure maximum compatibility, especially on Windows Pro/Enterprise editions, you might need to enable the **Shell Launcher** feature:
1. Open the Start Menu and search for **"Turn Windows features on or off"**.
2. Scroll down and look for **"Shell Launcher"** (or *Embedded Shell Launcher* / *Custom Logon* depending on your Windows version).
3. Check the box, click OK, and restart your computer if prompted.

## 🛠️ How it works

The project relies on modifying a temporary registry key (`HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell`) for the current user to force Windows Terminal to start in full screen instead of Explorer. When you type `exit` in the CLI, the script safely restores the default configuration and relaunches Explorer.

## 🚀 Installation (Automated)

We provide a simple installer script to set everything up for you!

1. Download the latest release from the **Releases** tab, or clone the repository.
2. Extract all files into a folder.
3. Right-click on `Install.ps1` and select **"Run with PowerShell"**.
4. The script will automatically copy the required files to `C:\CLI` and create shortcuts on your **Desktop** and **Start Menu**.
> *Note: Windows blocks automatic pinning to the Taskbar for security reasons. To pin WinCLI-Mode to your taskbar, simply search for it in the Start Menu, right-click the shortcut, and select "Pin to taskbar".*

## 💻 Usage

1. Double-click the **WinCLI Mode** shortcut on your Desktop or Start Menu.
2. The system will confirm the activation and log you out.
3. Log back in with your Windows account.
4. Instead of the desktop, a full-screen command-line environment will launch.
5. To return to standard Windows, simply type `exit` and press Enter. The desktop will be reloaded instantly.

## ⚠️ Safety & Emergency Recovery
- **Do not forcefully close the terminal.** ALWAYS type `exit` so the script can safely restore the registry settings.
- **In case you get stuck:** If for any reason you end up on a black screen without a terminal, press `CTRL + SHIFT + ESC` to open the Task Manager. Click on *Run new task*, type `explorer.exe` and press Enter.

## 📜 License
Distributed under the MIT License. Feel free to fork, modify, and improve the project!
