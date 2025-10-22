# Kitty 快速筆記

搭配 `kitty/kitty.conf` 的最小必備說明，重點放在常用的 macOS 鍵位與幾個記得開的選項。

## 起手外觀

- 字型：`JetBrainsMono Nerd Font`，大小 `20.0`，四種字重皆使用。
- 背景：透明度 `0.5`，模糊 `32`（macOS 才會生效），焦點視窗會自動提高透明度（`dynamic_background_opacity`）。
- 主題：Catppuccin Mocha，活躍邊框 `#cba6f7`、非活躍 `#313244`，提醒（bell）時 `#fab387` 提示。
- 色票以紫藍＋奶茶色為主，標籤列 `#cba6f7` × `#11111b` 對比，游標沿用 `#f5e0dc`。

## 主要快捷鍵

### 視窗與標籤

- `cmd+enter`：同一標籤開新視窗。
- `cmd+shift+enter`：開新 OS 視窗（全新 Kitty 窗口）。
- `cmd+]` / `cmd+[`：在同標籤內切換視窗。
- `cmd+t` / `cmd+shift+w`：新增 / 關閉標籤。
- `cmd+shift+[` / `cmd+shift+]`：上一個 / 下一個標籤。
- `cmd+1`～`cmd+9`：直接跳到指定標籤。
- `cmd+w`：直接關閉目前視窗。

### 佈局與尺寸

- `cmd+shift+方向鍵`：把焦點視窗移往上 / 下 / 左 / 右。
- `cmd+alt+方向鍵`：調整目前視窗大小；`cmd+alt+home` 重設尺寸。
- `cmd+shift+l`：輪替佈局（tall、fat、grid、horizontal、vertical、stack）。
- `cmd+shift+f`：切換全螢幕模式。
- `cmd+=` / `cmd+-` / `cmd+0`：所有窗格字體放大 / 縮小 / 重置。
- `cmd+shift+=` / `cmd+shift+-` / `cmd+shift+0`：提高 / 降低 / 還原背景透明度。

### 捲動、剪貼簿

- `cmd+up` / `cmd+down`：跳到上一個 / 下一個命令提示。
- `cmd+page_up` / `cmd+page_down`：整頁捲動；`cmd+home` / `cmd+end` 移動到頂端 / 底部。
- `cmd+c` / `cmd+v`：複製 / 貼上（系統剪貼簿）。
- `cmd+shift+v`：從 selection 貼上（滑鼠選取的內容）。
- `cmd+shift+r`：重新載入 `kitty.conf`，立即更新設定。

## 小提醒

- `macos_option_as_alt yes` 讓 Option 充當 Alt，配合終端快捷鍵較直覺。
- `shell_integration enabled` 與 `editor nvim` 方便從外部命令回到 Neovim。
- 需要檢查按鍵時，執行 `kitty +kitten show_key`；確認設定載入可用 `kitty --debug-config`。

## 檔案位置

- 設定檔：`~/.config/kitty/kitty.conf`
- 這份筆記：`~/.config/nvim/keymaps/KITTY.md`
