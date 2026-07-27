<p align="center">
  <img src="https://github.com/user-attachments/assets/5755fda2-773a-47f7-a7d5-6fb5b1c72017" width="49%" alt="Desktop Preview 1" />
  <img src="https://github.com/user-attachments/assets/09b42502-ff44-45fb-a197-55209b65bbaa" width="49%" alt="Desktop Preview 2" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/317cfa65-0449-477a-af33-9623f0201a23" width="49%" alt="Desktop Preview 3" />
  <img src="https://github.com/user-attachments/assets/c3199314-ebb7-4a91-9f5a-184fa2f5abc7" width="49%" alt="Desktop Preview 4" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/a127511f-6bb2-4be4-876d-2d759a61c3ca" width="49%" alt="Desktop Preview 5" />
    <img src="https://github.com/user-attachments/assets/a03b9312-e51a-40a4-9768-7cc910127d05" width="49%" alt="Desktop Preview 6" />
</p>



# Hyprland Dotfiles

A clean, wallpaper-driven Hyprland setup built around **Noctalia Shell** (a Quickshell-based desktop shell) - every color in the config (bar, launcher, notifications, terminal, GTK, lock screen, Hyprland borders) is generated dynamically from your wallpaper's Material You palette. Swap the wallpaper from the built-in wallpaper panel, and the entire system recolors itself automatically.

The setup uses the **Colloid GTK theme** and **Tela Circle** icon theme for a cohesive shape/icon look, **Geist Mono Nerd** as the terminal font, **Geist** for shell UI text, and **Rose Pine** as the cursor theme. The aesthetic leans minimal and dark, with transparent/blurred surfaces that adapt to whatever palette Noctalia generates.

## 🚀 Installation

The installer is interactive. You can choose exactly which dotfiles you want to link to your system.

1. **Clone the repository**:
   ```bash
   git clone [https://github.com/tobiaszkonieczny/dotfiles.git](https://github.com/tobiaszkonieczny/dotfiles.git) ~/dotfiles

2. **Install packages with the setup script**:
   ```bash
   chmod +x setup.sh && ./setup.sh
   ```
   The script lets you pick exactly what to install. Essential and recommended packages are pre-selected; optional ones (e.g. `kdeconnect`, `zen-browser`) are off by default. Use `↑↓` to navigate, `Space` to toggle, `Enter` to confirm.

   > **Manual alternative:** see the [Necessary Programs](#-necessary-programs) and [System Utilities](#-system-utilities-and-tools) tables below for the full package list.

3. **Run the install script**:
   ```bash
   chmod +x install.sh ./install.sh
   ```
5. Run Hyprland with:
   ```bash
   start-hyprland
## 🐧 OS
I personally use EndeavourOS, choose any distro that works well with Hyprland.


## 📦 Necessary Programs
If you want this setup to be fully functional:
| **Category**      | **Program**         | **Description**                            |
| ----------------- | ------------------- | ------------------------------------------ |
| **Compositor**    | `hyprland`          | Smooth Wayland tiling WM                   |
| **File Linker**   | `Stow   `           | Creates config symlinks (used by install script)|
| **Polkit Agent**  | `hyprpolkitagent`   | Necessary for elevation prompts (GUI sudo) |
| **Shell Toolkit** | `quickshell`        | QML-based Wayland shell toolkit that Noctalia runs on |
| **Desktop Shell** | `noctalia-shell`    | Bar, app launcher, notification center, control center, lock screen, wallpaper picker and dynamic theming - all in one |
| **Terminal**      | `foot`              | Lightweight Wayland terminal               |
| **Geist Mono Nerd Font**| `otf-geist-mono-nerd`| Primary font for the terminal and bar icons.|
| **Geist Sans**    | `ttf-geist`          | Secondary font for UI elements             |
| **Portal**        | `xdg-desktop-portal-hyprland` | Enables screen sharing, file dialogs, and app integration on Wayland |
| **Qt6 Support**   | `qt6-wayland`        | Allows Qt6 applications to run natively on Wayland |


## 🔧 System Utilities and Tools

| **Program**      | **Role in Config**                                 |
| ---------------- | -------------------------------------------------- |
| `hyprpicker`     | Color picker (`$mainMod + H`)                      |
| `grim` + `slurp` | Screenshot area selection (`$mainMod + SHIFT + P`) |
| `wl-clipboard`   | Copying screenshots/text to system clipboard       |
| `brightnessctl`  | Laptop screen brightness control                   |
| `pavucontrol`    | Audio settings (invoked via Noctalia bar or keybinds) |
| `playerctl`      | Media control (Play/Pause/Next keys)               |
| `network-manager-applet` | Provides `nm-connection-editor` for advanced network settings (basic status/toggle lives in the Noctalia bar) |
| `blueman`        | Provides `blueman-manager` for advanced Bluetooth settings (basic status/toggle lives in the Noctalia bar) |
| `wireplumber`    | PipeWire session manager (required for audio/video to work) |

 ### Disclaimer:
 Some of these, are my personal preferences, for example foot as a terminal.
 Feel free to change it to something else after installation, it's just that initial keybindings in this config point to foot as a terminal. If you install these, everything should work out of the box.

## ✨ Nice-to-have Programs
These are my personal preferences, and are mentioned in hyprland.lua:

|**Category**      |**Program**           |**Description**|
|---               |---                   |---                  |
|**File Manager**  |`thunar`              |Fast GTK file manager|
|**Web Browser**   |`zen-browser`         |Minimalist browser (matches my opacity rules)|
|**IDE**           |`code-oss`            |VS Code (Open Source version)|
|**Communication** |`discord` & `caprine` |Apps with specific transparency rules|
|**System Info**   |`fastfetch` & `btop`  |Terminal system stats, styled with a Noctalia-generated theme|
|**Cursor Theme**  |`rose-pine-hyprcursor`|The cursor theme used in this config|
|**GTK Theme**     |`colloid-gtk-theme`   |GTK shape theme used in this config (colors are recolored dynamically by Noctalia, apply the base theme via nwg-look)|
|**Icon Theme**    |`tela-circle-icon-theme`|Icon theme used in this config (apply via nwg-look)|
| **Theme Manager** | `nwg-look`         | Essential for setting GTK themes/icons        |
| **File Support**  | `gvfs`, `tumbler` & `ffmpegthumbnailer` | Trash, drive mounting, and image/video thumbnails |
| **Shell Prompt**  | `starship`         | The sleek, fast shell prompt used in terminal |
| **Shell**         | `zsh`              | Z shell used with the Starship prompt         |
| **Integrations**  | `kdeconnect`       | Sync your phone with Hyprland                 |



## ⌨️ Keybindings

> `$mainMod` = Super (Windows key)

### Apps & Noctalia Shell
| **Keybind**               | **Action**                        |
| ------------------------- | --------------------------------- |
| `Super + Q`               | Open terminal (foot)              |
| `Super + Shift + Q`       | Open terminal with fastfetch      |
| `Super + E`               | Open file manager (thunar)        |
| `Super + Space`           | Open app launcher (Noctalia)      |
| `Super + A`               | Toggle control center (Noctalia)  |
| `Super + N`               | Toggle notification center (Noctalia) |
| `Super + W`               | Toggle wallpaper picker (Noctalia)|
| `Super + ,`               | Toggle Noctalia settings          |
| `Super + X`               | Toggle session/power menu (Noctalia) |
| `Super + Shift + X`       | Lock screen (Noctalia)            |
| `Super + H`               | Color picker (hyprpicker)         |
| `Super + Shift + P`       | Screenshot (area select)          |

### Window Management
| **Keybind**               | **Action**                        |
| ------------------------- | --------------------------------- |
| `Super + C`               | Close active window               |
| `Super + V`               | Toggle floating                   |
| `Super + P`               | Toggle pseudo-tiling              |
| `Super + J`               | Toggle split direction            |
| `Super + G`               | Toggle window group               |
| `Super + Shift + G`       | Move window out of group          |
| `Super + Arrows`          | Move focus                        |
| `Super + Shift + Arrows`  | Resize active window              |
| `Super + LMB drag`        | Move window                       |
| `Super + RMB drag`        | Resize window                     |

### Workspaces
| **Keybind**               | **Action**                        |
| ------------------------- | --------------------------------- |
| `Super + 1–0`             | Switch to workspace 1–10          |
| `Super + Shift + 1–0`     | Move window to workspace 1–10     |
| `Super + S`               | Toggle special workspace          |
| `Super + Shift + S`       | Move window to special workspace  |
| `Super + Scroll`          | Cycle through workspaces          |


## ✅ Post-Install Checklist

After running `./install.sh` and starting Hyprland, go through this before anything else:
- [ ] Start hyprland with `start-hyprland`
- [ ] Put your wallpapers in `~/Pictures/wallpapers/` (the installer copies a default one in for you)
- [ ] Open the wallpaper picker (`Super + W`) and pick a wallpaper - Noctalia regenerates the whole color palette (bar, launcher, foot, GTK, Hyprland borders, lock screen) from it instantly
- [ ] Set GTK theme and icons via `nwg-look`
- [ ] Check monitors with `hyprctl monitors` and adjust `hyprland.lua` if needed
- [ ] Verify audio works - if not, check `wireplumber` is running (`systemctl --user status wireplumber`)


### 🐚 Shell Setup (Zsh)
To enable the **Starship** prompt, add the following to your `~/.zshrc`:

```zsh
# Init Starship
eval "$(starship init zsh)"
```

# ⚠️ Important Notes
## 🖥️ Monitor Setup

My config is tailored for a dual monitor setup (1080p laptop + 1440p 144Hz external). If your screen goes black or resolution is wrong, edit the `hl.monitor(...)` lines at the top of `hyprland.lua` to match your hardware names (check them with `hyprctl monitors`).

## 🎨 Wallpaper & Theming
This config assumes you have your wallpapers under `~/Pictures/wallpapers`. Put some images in this directory - they'll show up in Noctalia's wallpaper picker (`Super + W`).

Noctalia generates a Material You color scheme straight from the selected wallpaper and applies it live to the bar, launcher, notifications, control center, foot terminal, GTK apps, btop, and Hyprland's active/inactive border colors - no separate color-generation step (e.g. Pywal) is needed. Theme generation state lives in `~/.local/state/noctalia/settings.toml`, and generated templates (foot theme, `noctalia.lua` border colors, terminal sequences, GTK CSS, etc.) are written out automatically whenever the wallpaper or theme changes.

Wallpaper: Original art from the movie Your Name (Kimi no Na wa) by CoMix Wave Films. All rights belong to their respective owners.
