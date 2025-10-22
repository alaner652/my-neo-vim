# Neovim × Kitty 配置指南

這份設定以「終端友善」與「原生哲學」為核心：Neovim 保留大部分 Vim 預設行為，同時以輕量映射提高手感；Kitty 則維持原生邏輯，額外補上跨平台一致的窗格操作。

## 配置特色

- **原生優先**：`Ctrl+w`、`gd` 等經典操作完全保留，僅以 `<leader>` 系列延伸常用功能。
- **終端友善**：避免與常見終端快捷鍵衝突，無論在 macOS、Arch 皆能共用。
- **模組化管理**：由 `lazy.nvim` 控制外掛，邏輯拆分於 `lua/config` 與 `lua/plugins`，易於維護。
- **跨平台考量**：Kitty 針對不同系統提供對應鍵位，確保肌肉記憶一致。

## 快速開始

1. **安裝依賴**

   ```bash
   # macOS
   brew install neovim ripgrep fd node

   # Arch
   sudo pacman -S neovim ripgrep fd nodejs npm
   ```

   建議安裝 Nerd Font（如 JetBrainsMono Nerd Font）以支援圖示顯示。

2. **放置設定**

   ```bash
   git clone <your-config-repo> ~/.config/nvim
   ```

3. **啟動 Neovim**
   ```bash
   nvim
   ```
   第一次啟動會自動安裝外掛；完成後即可使用。

## 目錄導覽

- `init.lua`：核心設定與啟動流程。
- `lazy-lock.json`：Lazy 管理的外掛鎖定檔（自動產生）。
- `lua/config`
  - `lazy.lua`：Lazy 初始化與外掛載入規則。
  - `keymaps.lua`：快捷鍵定義與供外掛呼叫的 LSP/格式化映射。
- `lua/plugins`：依功能拆分的外掛設定。
- `kitty.conf`（另存於 `~/.config/kitty/`）：終端專用設定，內含跨平台鍵位。

## 常用指令

```vim
:Lazy sync       " 更新或安裝外掛
:Mason           " 管理 LSP / 格式化工具
:checkhealth     " 健康檢查
:source $MYVIMRC " 重新載入設定
```

## 疑難排解

- **快捷鍵延遲或無反應**：使用 `:verbose map <leader>fs` 等指令確認映射來源，或調整 `timeoutlen`。
- **Kitty 映射失效**：在終端輸入 `kitty +kitten show_key` 確認按鍵是否被系統攔截，再檢查 `kitty.conf`。
- **背景透明度無效**：macOS 需支援透明並關閉「減少透明度」；Wayland 需在 compositor 允許透明。
- **字型缺失**：確認終端已選擇 Nerd Font，重新啟動 Kitty 後再次嘗試。

若要調整映射或外掛，建議先在對應檔案內修改並同步更新文件，保持配置與說明一致。歡迎依需求客製並紀錄變更，方便未來回顧。\*\*\*
