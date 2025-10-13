# Neovim 配置文檔

> 基於 `lazy.nvim` 的現代化 VSCode 風格 Neovim 配置

## ✨ 特色功能

- 🏠 **啟動畫面** - Alpha-nvim 簡潔的 Dashboard 首頁
- 🎨 **透明主題** - Catppuccin Mocha 配色，支援透明背景
- 📊 **狀態列 & 標籤頁** - Lualine 狀態列 + Bufferline 標籤頁管理
- ⌨️  **VSCode 快捷鍵** - 熟悉的 Ctrl+S、Ctrl+P、Alt+1-9 等快捷鍵
- 🔍 **模糊搜尋** - Telescope 快速尋找檔案與內容
- 📁 **檔案樹** - Neo-tree 側邊欄檔案瀏覽器（VSCode 風格）
- 💡 **智慧補全** - LSP 驅動的自動完成與程式碼提示
- 🎯 **語法高亮** - Treesitter 精準的語法解析
- 🚀 **快速啟動** - 懶載入插件機制

## 📦 已安裝插件

| 插件 | 功能 |
|------|------|
| **lazy.nvim** | 插件管理器 |
| **alpha-nvim** | 啟動畫面 Dashboard |
| **Catppuccin** | 主題配色（支援透明） |
| **Lualine** | 底部狀態列（VSCode 風格） |
| **Bufferline** | 頂部標籤頁管理 |
| **Telescope** | 模糊搜尋工具 |
| **Neo-tree** | 檔案樹側邊欄（VSCode 風格） |
| **Mason** | LSP 服務器管理 |
| **nvim-lspconfig** | LSP 配置 |
| **nvim-cmp** | 自動補全引擎 |
| **nvim-treesitter** | 語法高亮與解析 |

## ⌨️  VSCode 風格快捷鍵

### 檔案操作

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl + S` | 儲存檔案 |
| `Ctrl + W` | 關閉當前檔案 |
| `Ctrl + Q` | 退出 Neovim |
| `Ctrl + P` | 快速開啟檔案 |
| `Ctrl + B` | 切換側邊欄 |

### 標籤頁管理（Bufferline）

| 快捷鍵 | 功能 |
|--------|------|
| `Alt + ,` | 上一個標籤 |
| `Alt + .` | 下一個標籤 |
| `Alt + 1-9` | 跳到第 1-9 個標籤 |
| `Alt + 0` | 跳到最後一個標籤 |
| `Alt + C` | 關閉當前標籤 |
| `Alt + P` | 釘選/取消釘選標籤 |
| `Alt + <` | 向左移動標籤 |
| `Alt + >` | 向右移動標籤 |

### 編輯操作

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl + A` | 全選 |
| `Ctrl + Z` | 復原 |
| `Ctrl + Y` | 重做 |
| `Ctrl + D` | 複製當前行 |
| `Ctrl + F` | 搜尋 |
| `Ctrl + /` | 切換註解 |

### 行操作

| 快捷鍵 | 功能 |
|--------|------|
| `Alt + ↑` | 向上移動行 |
| `Alt + ↓` | 向下移動行 |
| `Tab` | 增加縮排（Visual 模式） |
| `Shift + Tab` | 減少縮排（Visual 模式） |

### 視窗操作

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl + H` | 移到左邊視窗 |
| `Ctrl + J` | 移到下方視窗 |
| `Ctrl + K` | 移到上方視窗 |
| `Ctrl + L` | 移到右邊視窗 |
| `Ctrl + \` | 垂直分割視窗 |

### 搜尋與導航

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl + P` | 快速開啟檔案 |
| `Ctrl + Shift + F` | 全域搜尋 |
| `Ctrl + Shift + P` | 指令面板 |
| `Ctrl + Tab` | 切換已開啟檔案 |
| `Esc` | 清除搜尋高亮 |

### Neo-tree 檔案樹操作

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl + B` | 切換檔案樹 |
| `Space + E` | 聚焦到檔案樹 |
| `Enter` | 開啟檔案/展開資料夾 |
| `a` | 新增檔案 |
| `A` | 新增資料夾 |
| `d` | 刪除 |
| `r` | 重新命名 |
| `x` | 剪下 |
| `c` | 複製 |
| `p` | 貼上 |
| `H` | 切換顯示隱藏檔案 |
| `R` | 重新整理 |
| `?` | 顯示所有快捷鍵 |

### LSP 功能

| 快捷鍵 | 功能 |
|--------|------|
| `gd` | 跳轉到定義 |
| `K` | 顯示懸浮文件 |
| `Space + rn` | 重新命名符號 |

### 自動補全

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl + K` | 上一個補全項目 |
| `Ctrl + J` | 下一個補全項目 |
| `Ctrl + Space` | 手動觸發補全 |
| `Enter` | 確認補全 |

## 🖥️  介面配置

### 啟動畫面（Alpha-nvim）
- 簡潔的歡迎畫面
- 快速操作按鈕
  - `f` - 查找文件
  - `e` - 新建文件
  - `r` - 最近文件
  - `g` - 查找文字
  - `c` - 配置設定
  - `q` - 退出程式
- 顯示插件數量與系統資訊
- 自動在關閉所有 buffer 後顯示

### 頂部標籤頁（Bufferline）
- 顯示所有已開啟的檔案
- LSP 診斷圖示顯示
- 修改狀態指示器
- 滑鼠點擊支援
- 可釘選常用檔案

### 底部狀態列（Lualine）
- 當前模式顯示（NORMAL、INSERT 等）
- Git 分支與變更統計
- LSP 診斷資訊
- 檔案編碼與格式
- 游標位置與百分比

### 左側檔案樹（Neo-tree）
- VSCode 風格的檔案圖示
- Git 狀態顯示
- 自動跟隨當前檔案
- 資料夾展開/收合動畫
- 檔案搜尋與過濾

## 🛠️  內建設定

```lua
-- 顯示設定
行號顯示（相對行號）
高亮當前行
真彩色支援
透明背景

-- 編輯設定
Tab 寬度: 2 空格
智慧縮排
自動完成大小寫搜尋
即時搜尋高亮

-- 視窗設定
新視窗在下方/右方開啟
捲動時保持 8 行邊距
滑鼠支援啟用
全域狀態列
```

## 📋 LSP 語言伺服器

自動安裝以下語言伺服器：

- **lua_ls** - Lua
- **tsserver** - TypeScript/JavaScript
- **html** - HTML
- **cssls** - CSS
- **jsonls** - JSON

## 🎨 Treesitter 支援語言

- Lua
- JavaScript
- HTML
- CSS
- Python

## 🚀 快速開始

### 安裝需求

```bash
# macOS
brew install neovim ripgrep fd

# Ubuntu/Debian
sudo apt install neovim ripgrep fd-find

# Arch Linux
sudo pacman -S neovim ripgrep fd
```

### 首次安裝

1. 備份現有配置（如有）
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. 複製此配置
```bash
git clone <your-repo> ~/.config/nvim
```

3. 啟動 Neovim
```bash
nvim
```

4. 等待插件自動安裝完成

5. 重新啟動 Neovim

## 🔧 常用指令

### Dashboard
```vim
:Alpha             " 顯示啟動畫面
```

### 插件管理
```vim
:Lazy              " 開啟插件管理介面
:Lazy update       " 更新所有插件
:Lazy sync         " 同步插件（安裝/更新/清理）
:Lazy clean        " 清理未使用的插件
```

### LSP 管理
```vim
:Mason             " 開啟 LSP 管理介面
:MasonInstall <server>   " 安裝語言伺服器
:MasonUninstall <server> " 解除安裝語言伺服器
:LspInfo           " 查看 LSP 狀態
```

### Treesitter 管理
```vim
:TSUpdate          " 更新所有解析器
:TSInstall <lang>  " 安裝特定語言解析器
:TSUninstall <lang> " 解除安裝解析器
```

### Bufferline 指令
```vim
:BufferLinePick           " 互動式選擇標籤
:BufferLineCloseLeft      " 關閉左側所有標籤
:BufferLineCloseRight     " 關閉右側所有標籤
:BufferLineCloseOthers    " 關閉其他標籤
```

## 📁 目錄結構

```
~/.config/nvim/
├── init.lua                  # 主配置檔（含 VSCode 風格設定）
├── lazy-lock.json           # 插件版本鎖定
└── lua/
    ├── config/
    │   ├── lazy.lua         # 插件管理器設定
    │   └── keymaps.lua      # VSCode 風格快捷鍵
    └── plugins/
        ├── alpha.lua        # 啟動畫面 Dashboard
        ├── catppuccin.lua   # 透明主題配置
        ├── lualine.lua      # 狀態列配置
        ├── bufferline.lua   # 標籤頁配置
        ├── telescope.lua    # 模糊搜尋
        ├── neo-tree.lua     # 檔案樹（VSCode 風格）
        ├── lsp.lua          # LSP 伺服器
        ├── cmp.lua          # 自動補全
        └── treesitter.lua   # 語法解析器
```

## 🎯 自訂配置

### 修改主題透明度

編輯 `lua/plugins/catppuccin.lua`：
```lua
transparent_background = false  -- 改為 false 停用透明
```

### 調整標籤頁樣式

編輯 `lua/plugins/bufferline.lua`：
```lua
separator_style = "slant"  -- 可選: "slant", "slope", "thick", "thin"
```

### 修改狀態列主題

編輯 `lua/plugins/lualine.lua`：
```lua
theme = "auto"  -- 可選: "auto", "catppuccin", "tokyonight" 等
```

### 新增 LSP 伺服器

編輯 `lua/plugins/lsp.lua`：
```lua
ensure_installed = { "lua_ls", "tsserver", "新伺服器名稱" }
```

### 新增快捷鍵

編輯 `lua/config/keymaps.lua`：
```lua
map("n", "<快捷鍵>", "<指令>", { desc = "說明" })
```

### 安裝新插件

在 `lua/plugins/` 建立新檔案 `my-plugin.lua`：
```lua
return {
  "作者/插件名稱",
  config = function()
    -- 插件配置
  end,
}
```

## ❓ 常見問題

### 插件無法安裝
執行 `:Lazy sync` 重新同步

### LSP 沒有作用
1. 檢查 `:Mason` 確認伺服器已安裝
2. 執行 `:LspInfo` 查看狀態
3. 確認 Node.js 已安裝（部分伺服器需要）

### 透明背景沒有效果
確認終端機支援真彩色並啟用透明度

### 標籤頁圖示無法顯示
確認已安裝 Nerd Font 字型並在終端機中啟用

### 快捷鍵衝突
檢查 `lua/config/keymaps.lua` 並修改衝突的快捷鍵

### 狀態列沒有顯示
執行 `:LualineRefresh` 重新整理狀態列

## 💡 使用技巧

1. **快速導航**: 使用 `Alt + 1-9` 快速跳到指定標籤
2. **釘選檔案**: 使用 `Alt + P` 釘選常用檔案，避免被誤關
3. **標籤搜尋**: 使用 `:BufferLinePick` 進行互動式標籤選擇
4. **檔案樹操作**: 在 Neo-tree 中按 `?` 查看所有可用快捷鍵
5. **分割視窗**: 在 Neo-tree 中按 `s` 垂直分割，`S` 水平分割開啟檔案

## 📚 延伸閱讀

- [Neovim 官方文件](https://neovim.io/doc/)
- [lazy.nvim 文件](https://github.com/folke/lazy.nvim)
- [LSP 伺服器列表](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
- [Catppuccin 主題](https://github.com/catppuccin/nvim)
- [Lualine 配置](https://github.com/nvim-lualine/lualine.nvim)
- [Bufferline 文件](https://github.com/akinsho/bufferline.nvim)

---

**提示**: 這個配置盡可能模仿 VSCode 的使用體驗，讓你可以無縫切換！建議搭配 Nerd Font 字型以獲得最佳視覺效果。
