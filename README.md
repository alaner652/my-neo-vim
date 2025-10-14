# Neovim 配置

簡潔高效的 Neovim 配置，終端友好，專為提升編碼效率而設計。

## 特色

- **終端友好** - 精心設計的快捷鍵避免與終端衝突
  - 避開 Ctrl+A/Z/F 等常見終端快捷鍵
  - 以 Space (Leader) 為核心的直觀映射
  - 完全相容 Kitty、iTerm2 等現代終端
- **完整 LSP 支援** - IDE 級別的智能功能
  - 代碼補全、跳轉、重構、診斷
  - 自動安裝和配置多種語言伺服器
  - 統一的快捷鍵管理系統
- **Kitty 終端整合** - 真正的無縫體驗
  - Ctrl+h/j/k/l 智能在 Neovim/Kitty 視窗間切換
  - 統一的 Catppuccin Mocha 主題
  - 透明背景 + 模糊效果
- **智能補全** - 快速且不干擾
  - 使用 Vim 風格 Ctrl+n/p 導航（無衝突）
  - Ghost text 預覽
  - 自動觸發，性能優化
- **自動格式化** - 支援多種格式化工具
  - Prettier, stylua, black, clang-format 等
  - Space+fm 一鍵格式化
- **快速搜尋** - Telescope 模糊搜尋
  - 檔案、內容、Buffer、命令一鍵查找
  - Ctrl+P 快速開啟檔案（VSCode 風格）
- **簡潔配置** - 易讀易懂易自訂
  - 模組化插件配置
  - 詳細註解
  - 完整文檔

## 安裝

### 1. 安裝依賴

```bash
# macOS
brew install neovim ripgrep fd node
brew install font-jetbrains-mono-nerd-font

# 或使用其他 Nerd Font
brew install font-hack-nerd-font
```

### 2. 克隆配置

```bash
git clone <your-repo-url> ~/.config/nvim
```

### 3. 啟動 Neovim

```bash
nvim
```

首次啟動會自動安裝所有插件，等待安裝完成即可。

### 4. 安裝 LSP 伺服器

進入 Neovim 後執行：

```vim
:Mason
```

常用的 LSP 伺服器會自動安裝，包括：
- `lua_ls` - Lua
- `ts_ls` - TypeScript/JavaScript
- `html`, `cssls`, `jsonls` - Web 開發
- `pyright` - Python（包含診斷功能）
- `clangd` - C/C++
- `jdtls` - Java

## Kitty 終端整合

本配置已完整整合 Kitty 終端，實現 Neovim 與 Kitty 視窗無縫導航。

### 配置 Kitty

編輯 `~/.config/kitty/kitty.conf`，加入以下關鍵配置：

```conf
# === Neovim 整合（必需）===
allow_remote_control yes
listen_on unix:/tmp/kitty

# macOS 設定（讓 Alt 鍵正常工作）
macos_option_as_alt yes

# 視窗導航（與 Neovim 無縫整合）
map ctrl+j kitten pass_keys.py neighboring_window bottom ctrl+j
map ctrl+k kitten pass_keys.py neighboring_window top    ctrl+k
map ctrl+h kitten pass_keys.py neighboring_window left   ctrl+h
map ctrl+l kitten pass_keys.py neighboring_window right  ctrl+l

# 主題（與 Neovim 統一使用 Catppuccin Mocha）
include ~/.config/kitty/catppuccin-mocha.conf

# 字型（需要 Nerd Font 支援圖示）
font_family JetBrainsMono Nerd Font
font_size 13.0

# 透明背景（macOS）
background_opacity 0.92
background_blur 32
```

### 安裝導航腳本

需要複製 `pass_keys.py` 腳本到 Kitty 配置目錄：

```bash
cp ~/.local/share/nvim/lazy/vim-kitty-navigator/*.py ~/.config/kitty/
```

完成後重啟 Kitty，你就可以用 `Ctrl+h/j/k/l` 在 Neovim 分割視窗和 Kitty 終端視窗間無縫切換了！

### 工作原理

- 在 Neovim 視窗內使用 `Ctrl+h/j/k/l` → 切換 Neovim 分割視窗
- 在 Neovim 邊緣使用 `Ctrl+h/j/k/l` → 自動跳到 Kitty 視窗
- 在 Kitty 視窗使用 `Ctrl+h/j/k/l` → 切換 Kitty 視窗或回到 Neovim

智能且無感！

## 已安裝插件

### 核心功能
- **lazy.nvim** - 插件管理器
- **nvim-lspconfig** - LSP 客戶端配置
- **mason.nvim** - LSP/工具安裝管理器
- **nvim-cmp** - 自動補全引擎
- **nvim-treesitter** - 語法解析和高亮

### 編輯增強
- **Comment.nvim** - 快速註解/取消註解
- **nvim-autopairs** - 自動配對括號、引號
- **LuaSnip** - 代碼片段引擎

### UI 增強
- **catppuccin** - 美觀的主題
- **lualine.nvim** - 狀態欄
- **bufferline.nvim** - Buffer/Tab 列
- **neo-tree.nvim** - 文件樹側邊欄
- **alpha-nvim** - 啟動畫面
- **nvim-web-devicons** - 文件圖標

### 搜尋與導航
- **telescope.nvim** - 模糊搜尋檔案、內容、命令
- **vim-kitty-navigator** - Kitty 終端整合

### 格式化與檢查
- **none-ls.nvim** - 格式化工具整合
- **prettier**, **stylua**, **black** 等 - 各語言格式化工具

## 快速上手

### 常用快捷鍵（終端友好設計）

#### 檔案操作
```
Ctrl+S          儲存檔案
Ctrl+P          快速開啟檔案
Ctrl+B          開關側邊欄
Space+w         儲存檔案
Space+Q         強制離開全部
```

#### 編輯操作
```
Space+a         全選
Space+/         註解/取消註解
Space+dd        複製當前行
Alt+j/k         上下移動行
jk              快速離開插入模式
```

#### 視窗導航（與 Kitty 整合）
```
Ctrl+h/j/k/l    切換視窗（含 Kitty）
Space+v         垂直分割
Space+h         水平分割
Space+x         關閉視窗
```

#### 搜尋與導航
```
Space+s         搜尋
Space+ff        尋找檔案
Space+fg        全域搜尋內容
Space+fb        Buffer 列表
Space+fr        最近檔案
```

#### LSP 功能
```
gd              跳至定義
gr              顯示引用
K               顯示文件
Space+rn        重新命名
Space+ca        程式碼操作
Space+fm        格式化代碼
[d / ]d         上/下個診斷
```

#### Buffer 管理
```
]b / [b         切換 Buffer
Space+1-9       跳到指定 Buffer
Space+c         關閉當前 Buffer
Space+C         關閉其他 Buffer
```

更多快捷鍵請參考 [KEYMAPS.md](KEYMAPS.md)

### 常用命令

```vim
:Lazy            " 管理插件
:Mason           " 安裝 LSP 工具
:Telescope       " 查看所有搜尋功能
:Neotree toggle  " 開關文件樹
:checkhealth     " 檢查配置狀態
```

## 支援的語言

已預裝以下語言的 LSP 和格式化工具：

- **Lua** - lua_ls, stylua
- **JavaScript/TypeScript** - ts_ls, prettier, eslint_d
- **Python** - pyright (LSP + 診斷), black, isort
- **HTML/CSS** - html, cssls
- **JSON/YAML** - jsonls
- **C/C++** - clangd, clang-format
- **Java** - jdtls, google-java-format
- **Shell** - bashls, shfmt

> **注意**: Python 診斷使用 pyright LSP，不再使用 flake8（none-ls 已移除該支援）

需要其他語言支援？執行 `:Mason` 安裝對應的 LSP 伺服器。

## 配置結構

```
~/.config/nvim/
├── init.lua                    # 主配置文件
├── lua/
│   ├── config/
│   │   ├── lazy.lua           # Lazy.nvim 配置
│   │   └── keymaps.lua        # 快捷鍵配置
│   └── plugins/               # 插件配置
│       ├── lsp.lua            # LSP 配置
│       ├── cmp.lua            # 補全配置
│       ├── telescope.lua      # 搜尋配置
│       ├── neo-tree.lua       # 文件樹配置
│       ├── catppuccin.lua     # 主題配置
│       └── ...                # 其他插件
└── README.md                  # 本文件
```

## 自訂配置

### 修改快捷鍵

編輯 `lua/config/keymaps.lua` 檔案。

### 修改主題

編輯 `lua/plugins/catppuccin.lua`，可選主題：
- `latte` - 淺色
- `frappe` - 柔和深色
- `macchiato` - 中等深色
- `mocha` - 深色（目前使用）

### 新增插件

編輯任一 `lua/plugins/*.lua` 檔案，或新增檔案：

```lua
return {
    "author/plugin-name",
    config = function()
        -- 插件配置
    end,
}
```

重啟 Neovim，插件會自動安裝。

## 配置亮點

### 為什麼選擇這個配置？

1. **真正的終端友好設計**
   - 大多數 Neovim 配置忽略終端快捷鍵衝突
   - 本配置精心避開 Ctrl+A（行首）、Ctrl+Z（掛起）等終端快捷鍵
   - 保證在任何終端環境下都能流暢工作

2. **智能的快捷鍵衝突解決**
   - 補全菜單使用 Ctrl+n/p（Vim 風格），視窗導航使用 Ctrl+h/j/k/l
   - 避免快捷鍵功能重疊，每個按鍵都有明確的用途
   - Tab 鍵在補全和片段跳轉間智能切換

3. **統一的 LSP 快捷鍵管理**
   - 所有 LSP 快捷鍵集中在 `keymaps.lua` 中定義
   - 通過 `_G.keymaps` 全局變量實現插件間共享
   - 修改快捷鍵時只需改一處，所有 LSP 伺服器同步更新

4. **完整的 Kitty 整合**
   - 不僅配置 Neovim，也提供完整的 Kitty 配置
   - 智能檢測 Neovim 進程，自動決定快捷鍵行為
   - 主題、字體、透明度完全統一

5. **性能優化**
   - CMP 補全引擎優化配置（debounce, throttle）
   - 按需載入插件（lazy loading）
   - 合理的 updatetime 和 timeoutlen 設定

### 設計哲學

- **簡潔勝於複雜** - 每個插件都有明確用途，無冗餘配置
- **可讀性優先** - 詳細註解，清晰的文件結構
- **實用主義** - 快捷鍵設計基於實際使用頻率
- **無驚喜原則** - 快捷鍵行為可預測，不會意外觸發

## 疑難排解

### 插件安裝失敗

```vim
:Lazy sync
```

### LSP 無法啟動

```vim
:LspInfo          " 查看 LSP 狀態
:Mason            " 重新安裝 LSP 伺服器
:checkhealth lsp  " 檢查 LSP 健康狀態
```

### Kitty 導航不工作

1. 確認 Kitty 配置正確
2. 確認已複製導航腳本到 `~/.config/kitty/`
3. 重啟 Kitty 終端

### 字體圖標顯示不正常

確認終端使用的是 Nerd Font：
```bash
fc-list | grep -i "nerd"
```

在 Kitty 配置中設定字體：
```conf
font_family JetBrains Mono Nerd Font
```

## 最近更新

### 2025-10-14 (更新 2)
- ✅ **修復 none-ls flake8 錯誤** - 移除已廢棄的 flake8 配置
- ✅ **添加 pyright LSP** - Python 診斷改用 pyright（更現代的解決方案）
- ✅ **更新文檔** - 反映 Python 工具鏈的變更

### 2025-10-14 (更新 1)
- ✅ **修復快捷鍵衝突** - CMP 補全改用 Ctrl+n/p，避免與視窗導航 Ctrl+h/j/k/l 衝突
- ✅ **優化 Kitty 整合文檔** - 更新 README 反映完整的 Kitty 配置
- ✅ **完善插件說明** - kitty-navigator 插件添加詳細的配置要求
- ✅ **擴展特色說明** - 添加配置亮點和設計哲學說明
- ✅ **文檔一致性** - 確保 README.md 和 KEYMAPS.md 內容同步

### 主要改進
1. **無衝突的快捷鍵系統** - 所有快捷鍵經過全面審查，確保無功能重疊
2. **現代化的工具鏈** - 使用 LSP 提供診斷，而非獨立工具
3. **更清晰的文檔** - 每個配置選擇都有明確的解釋和理由
4. **完整的整合指南** - Neovim + Kitty 的完整配置說明

## 授權

MIT License
