<p align="center">
  <img src="https://github.com/user-attachments/assets/5755fda2-773a-47f7-a7d5-6fb5b1c72017" width="49%" alt="Desktop Preview 1" />
  <img src="https://github.com/user-attachments/assets/09b42502-ff44-45fb-a197-55209b65bbaa" width="49%" alt="Desktop Preview 2" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/317cfa65-0449-477a-af33-9623f0201a23" width="49%" alt="Desktop Preview 3" />
  <img src="https://github.com/user-attachments/assets/c3199314-ebb7-4a91-9f5a-184fa2f5abc7" width="49%" alt="Desktop Preview 4" />
</p>

<p align="center">
  <img src="https://github.com/user-attachments/assets/a127511f-6bb2-4be4-876d-2d759a61c3ca" width="100%" alt="Desktop Preview 6" />
</p>

# Hyprland Dotfiles

A clean, wallpaper-driven Hyprland setup built around **Pywal** - every color in the config (waybar, foot, swaync, hyprlock, anyrun) is generated dynamically from your wallpaper. Swap the wallpaper, and the entire system recolors itself automatically.

The setup uses the **Colloid GTK theme** and **Tela Circle** icon theme for a cohesive look, **Geist Mono Nerd** as the terminal font, and **Rose Pine** as the cursor theme. The aesthetic leans minimal and dark, with transparent surfaces that adapt to whatever palette Pywal generates.

## 🚀 Installation

The installer is interactive. You can choose exactly which dotfiles you want to link to your system.

1. **Clone the repository**:
   ```bash
   git clone [https://github.com/tobiaszkonieczny/dotfiles.git](https://github.com/tobiaszkonieczny/dotfiles.git) ~/dotfiles

2. **Install necessary programs (look below)**
   ```bash
    yay -S --needed \
    hyprland \
    stow \
    hyprpolkitagent \
    xdg-desktop-portal-hyprland \
    waybar \
    anyrun-git \
    foot \
    python-pywal \
    swaync \
    waypaper-git \
    awww \
    hyprlock \
    wlogout \
    otf-geist-mono-nerd \
    ttf-geist \
    qt6-wayland \
    pavucontrol
  

3. **Install utilities (not needed but strongly recommended)**
   ```bash
    yay -S --needed \
    hyprpicker \
    grim \
    slurp \
    wl-clipboard \
    brightnessctl \
    wireplumber \
    playerctl \
    network-manager-applet \
    blueman \
    rose-pine-hyprcursor \
    nwg-look \
    thunar \
    gvfs \
    tumbler \
    ffmpegthumbnailer \
    fastfetch \
    btop \
    starship \
    zsh 

4. **Run the install script**:
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
| **Status Bar**    | `waybar`            | Highly customizable GTK bar                |
| **App Launcher**  | `anyrun`            | Fast and minimal runner                    |
| **Terminal**      | `foot`              | Lightweight Wayland terminal               |
| **Colors**        | `python-pywal`      | Generates color schemes from images        |
| **Notifications** | `swaync`            | Wayland notification center                |
| **Wallpaper**     | `waypaper` + `awww` | GUI and daemon for managing wallpapers     |
| **Screen Lock**   | `hyprlock`          | Elegant lockscreen for Hyprland            |
| **Logout Menu**   | `wlogout`           | Wayland logout menu                        |
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
| `pavucontrol`    | Audio settings (invoked via waybar or keybinds)    |
| `playerctl`      | Media control (Play/Pause/Next keys)               |
| `nm-applet`      | Network Manager tray icon                          |
| `blueman`        | Bluetooth manager applet                           |
| `wireplumber`    | PipeWire session manager (required for audio/video to work) |

 ### Disclaimer:
 Some of these, are my personal preferences, for example foot as a terminal.
 Feel free to change it to something else after installation, it's just that initial keybindings in this config point to foot as a terminal. If you install these, everything should work out of the box.

## ✨ Nice-to-have Programs
These are my personal preferences, and are mentioned in hyprland.conf:

|**Category**      |**Program**           |**Description**|
|---               |---                   |---                  |
|**File Manager**  |`thunar`              |Fast GTK file manager|
|**Web Browser**   |`zen-browser`         |Minimalist browser (matches my opacity rules)|
|**IDE**           |`code-oss`            |VS Code (Open Source version)|
|**Communication** |`discord` & `caprine` |Apps with specific transparency rules|
|**System Info**   |`fastfetch` & `btop`  |Terminal system stats|
|**Cursor Theme**  |`rose-pine-hyprcursor`|The cursor theme used in this config|
|**GTK Theme**     |`colloid-gtk-theme`   |GTK theme used in this config (apply via nwg-look)|
|**Icon Theme**    |`tela-circle-icon-theme`|Icon theme used in this config (apply via nwg-look)|
| **Theme Manager** | `nwg-look`         | Essential for setting GTK themes/icons        |
| **File Support**  | `gvfs`, `tumbler` & `ffmpegthumbnailer` | Trash, drive mounting, and image/video thumbnails |
| **Shell Prompt**  | `starship`         | The sleek, fast shell prompt used in terminal |
| **Shell**         | `zsh`              | Z shell used with the Starship prompt         |
| **Integrations**  | `kdeconnect`       | Sync your phone with Hyprland                 |



## ⌨️ Keybindings

> `$mainMod` = Super (Windows key)

### Apps
| **Keybind**               | **Action**                        |
| ------------------------- | --------------------------------- |
| `Super + Q`               | Open terminal (foot)              |
| `Super + Shift + Q`       | Open terminal with fastfetch      |
| `Super + E`               | Open file manager (thunar)        |
| `Super + W`               | Open Waypaper                     |
| `Alt + Space`             | Open app launcher (anyrun)        |
| `Super + H`               | Color picker (hyprpicker)         |
| `Super + N`               | Toggle notification center        |
| `Super + X`               | Logout menu (wlogout)             |
| `Super + Shift + X`       | Lock screen (hyprlock)            |
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
- [ x ] Pywal Initialization: The installer automatically generates an initial color palette from dotfiles/wallpaper/default.jpg.
- [ ] Start hyprland with `start-hyprland`
- [ ] Put your wallpapers in `~/Pictures/wallpapers/`
- [ ] Open Waypaper (`Super + W`) and select a wallpaper - this triggers Pywal to generate color files in `~/.cache/wal/`
- [ ] Set GTK theme and icons via `nwg-look`
- [ ] Check monitors with `hyprctl monitors` and adjust `hyprland.conf` if needed
- [ ] Verify audio works - if not, check `wireplumber` is running (`systemctl --user status wireplumber`)


### 🐚 Shell Setup (Zsh)
To enable the **Starship** prompt, add the following to your `~/.zshrc`:

```zsh
# Init Starship
eval "$(starship init zsh)"
```

# ⚠️ Important Notes
## 🖥️ Monitor Setup

My config is tailored for a triple monitor setup (1080p laptop + 1440p Ultrawide + 1440p 144Hz). If your screen goes black or resolution is wrong, edit the monitors section in hyprland.conf to match your hardware names (check them with hyprctl monitors).

## 🎨 Wallpaper & Pywal
This config assumes, that you have your wallpapers under ~/Pictures/wallpapers. Put some images in this directory, and these will be displayed in Waypaper. 

After install, run Waypaper and select a wallpaper. This will trigger Pywal to generate the necessary color files in ~/.cache/wal/. Without this, some elements might appear white or transparent, or you might get some errors.

Run Waypaper (`$mainMod + W`), pick a wallpaper, and let Pywal do its magic. The config expects colors to exist in ~/.cache/wal/.

Wallpaper: Original art from the movie Your Name (Kimi no Na wa) by CoMix Wave Films. All rights belong to their respective owners.