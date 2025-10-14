# Neovim 快捷鍵參考指南

> 終端友好配置 - 避免與終端衝突

**設計理念：**
- 避免與終端衝突的快捷鍵（Ctrl+A/Z/F 等）
- 以 `Space` (Leader 鍵) 為核心，簡單易記
- `Ctrl+hjkl` 與 Kitty 無縫整合
- 保留常用的 Ctrl 組合（Ctrl+S, Ctrl+P, Ctrl+B）

---

## 目錄

- [必學快捷鍵 ⭐](#必學快捷鍵-)
- [基本編輯](#基本編輯)
- [檔案與搜尋](#檔案與搜尋)
- [視窗管理](#視窗管理)
- [Buffer 管理](#buffer-管理)
- [LSP 智慧功能](#lsp-智慧功能)
- [其他實用功能](#其他實用功能)
- [Neo-tree 檔案樹](#neo-tree-檔案樹)
- [實用指令](#實用指令)

---

## 必學快捷鍵 ⭐

這些是最常用的快捷鍵，建議優先記住：

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Ctrl+S` | 儲存檔案 | 最常用 |
| `Ctrl+P` | 快速開啟檔案 | Telescope 搜尋 |
| `Ctrl+B` | 切換側邊欄 | Neo-tree |
| `Ctrl+H/J/K/L` | 視窗導航 | 支援 Kitty 整合 |
| `Space+a` | 全選 | 終端友好 |
| `Space+s` | 搜尋 | 當前檔案 |
| `Space+ff` | 尋找檔案 | Telescope |
| `Space+fg` | 全域搜尋 | Telescope grep |
| `Space+/` | 切換註解 | 最可靠方式 |
| `gd` | 跳到定義 | LSP |
| `Space+ca` | 程式碼操作 | LSP |
| `Space+fm` | 格式化 | LSP |
| `[b` / `]b` | 切換 Buffer | 上一個/下一個 |
| `Space+1-9` | 跳到 Buffer | 快速跳轉 |

---

## 基本編輯

### 檔案操作

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Ctrl+S` | 儲存檔案 | Insert 模式也能用 |
| `Space+w` | 儲存檔案 | Leader 鍵方式 |
| `Space+Q` | 強制離開全部 | 不儲存 |

### 編輯操作

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Space+a` | 全選 | 避免終端衝突 |
| `Space+s` | 搜尋 | 開啟搜尋模式 |
| `u` | 復原 | Vim 原生 |
| `Ctrl+R` | 重做 | Vim 原生 |
| `Esc` | 清除搜尋高亮 | |
| `jk` | 離開插入模式 | 快速鍵 |

### 行操作

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Alt+J/K` | 上下移動行 | Visual 模式也可用 |
| `Space+dd` | 複製目前行 | |
| `dd` | 刪除目前行 | Vim 原生 |
| `yy` | 複製目前行 | Vim 原生 |

### 縮排

| 快捷鍵 | 模式 | 功能 |
|--------|------|------|
| `Tab` | Visual | 增加縮排 |
| `Shift+Tab` | Visual | 減少縮排 |
| `>` / `<` | Normal | 增加/減少縮排 |

### 快速跳轉

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `gg` / `G` | 開頭/結尾 | Vim 原生 |
| `w` / `b` | 下/上一個字 | Vim 原生 |
| `0` / `$` | 行首/行尾 | Vim 原生 |

---

## 檔案與搜尋

### 檔案操作

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Ctrl+P` | 快速開啟檔案 | Telescope - 最常用 ⭐ |
| `Space+ff` | 尋找檔案 | Telescope |
| `Space+fr` | 最近檔案 | Telescope |
| `Space+fb` | Buffer 列表 | Telescope |
| `Space+fc` | 指令列表 | Telescope |
| `Space+fh` | 說明文件 | Telescope |

### 搜尋內容

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Space+fg` | 全域搜尋 | Telescope grep ⭐ |
| `Space+s` | 當前檔案搜尋 | `/` 搜尋模式 |
| `/` | 搜尋 | Vim 原生 |
| `n` / `N` | 下/上一個結果 | Vim 原生 |
| `Esc` | 清除高亮 | |

### Telescope 視窗操作

| 快捷鍵 | 功能 |
|--------|------|
| `Ctrl+J/K` | 上/下移動 |
| `Enter` | 開啟檔案 |
| `Esc` | 關閉 |

---

## 視窗管理

### 視窗導航 (與 Kitty 整合) ⭐

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Ctrl+H` | 左視窗 | Neovim ↔ Kitty 無縫切換 |
| `Ctrl+J` | 下視窗 | |
| `Ctrl+K` | 上視窗 | |
| `Ctrl+L` | 右視窗 | |

### 分割視窗

| 快捷鍵 | 功能 |
|--------|------|
| `Space+v` | 垂直分割 |
| `Space+h` | 水平分割 |
| `Space+x` | 關閉目前視窗 |

### 視窗大小調整

| 快捷鍵 | 功能 |
|--------|------|
| `Space+=` | 平均分配 |
| `Space+-/+` | 調整高度 |
| `Space+</\>` | 調整寬度 |

### 終端機

| 快捷鍵 | 功能 |
|--------|------|
| `Space+tt` | 水平終端 |
| `Space+tv` | 垂直終端 |
| `Esc Esc` (終端模式) | 離開終端模式（雙擊） |

---

## Buffer 管理

### Buffer 切換

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `]b` | 下一個 Buffer | ⭐ 推薦 |
| `[b` | 上一個 Buffer | ⭐ 推薦 |
| `Space+c` | 關閉目前 Buffer | |
| `Space+C` | 關閉其他 Buffer | |

### Buffer 跳轉

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Space+1-9` | 跳到指定 Buffer | ⭐ 快速跳轉 |
| `Space+bp` | 釘選 Buffer | |
| `Space+bh` | 關閉左側 Buffers | |
| `Space+bl` | 關閉右側 Buffers | |

---

## LSP 智慧功能

### 程式碼導航

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `gd` | 跳到定義 | ⭐ 最常用 |
| `gD` | 跳到聲明 | |
| `gi` | 跳到實作 | |
| `gr` | 顯示引用 | |
| `K` | 顯示文件 | Hover |
| `Ctrl+O/I` | 前/後跳 | 跳轉歷史 |

### 程式碼操作

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Space+ca` | 程式碼操作 | ⭐ Code Actions |
| `Space+rn` | 重新命名 | |
| `F2` | 重新命名 | VSCode 風格 |
| `Space+fm` | 格式化 | ⭐ Format |

### 診斷訊息

| 快捷鍵 | 功能 |
|--------|------|
| `[d` | 上一個診斷 |
| `]d` | 下一個診斷 |
| `Space+d` | 顯示診斷 |
| `Space+dl` | 診斷列表 |

---

## 其他實用功能

### 註解

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Space+/` | 切換註解 | ⭐ 推薦 |
| `gcc` | 註解目前行 | Comment.nvim |
| `gc` | 註解選取 | Visual 模式 |

### Neo-tree 檔案樹

| 快捷鍵 | 功能 | 說明 |
|--------|------|------|
| `Ctrl+B` | 切換側邊欄 | ⭐ VSCode 風格 |
| `Space+e` | 聚焦側邊欄 | |
| `Space+E` | 定位目前檔案 | |

#### Neo-tree 內操作

| 按鍵 | 功能 |
|------|------|
| `Enter` | 開啟/展開 |
| `a` | 新增檔案 |
| `d` | 刪除 |
| `r` | 重新命名 |
| `c/x/p` | 複製/剪下/貼上 |
| `H` | 顯示隱藏檔 |
| `?` | 顯示說明 |

### 自動補全

| 快捷鍵 | 模式 | 功能 |
|--------|------|------|
| `Ctrl+N` | Insert | 下一個補全項 |
| `Ctrl+P` | Insert | 上一個補全項 |
| `Tab` | Insert | 下一個/展開片段 |
| `Shift+Tab` | Insert | 上一個片段 |
| `Enter` | Insert | 確認補全 |
| `Ctrl+Space` | Insert | 觸發補全菜單 |

---

## 實用指令

### 配置管理

```vim
:e $MYVIMRC      " 開啟設定檔
:source $MYVIMRC " 重新載入
:Lazy sync       " 同步外掛
```

### LSP 與外掛

```vim
:Mason           " LSP 管理器
:Lazy            " 外掛管理器
:LspInfo         " LSP 狀態
:LspRestart      " 重啟 LSP
:checkhealth     " 健康檢查
```

### Vim 基本指令

```vim
:w               " 儲存
:q               " 離開
:wq              " 儲存並離開
:q!              " 強制離開
```

---

## Kitty 整合設定

確保 `~/.config/kitty/kitty.conf` 包含：

```conf
# Neovim 整合
allow_remote_control yes
listen_on unix:/tmp/kitty
macos_option_as_alt yes

# 視窗導航
map ctrl+j kitten pass_keys.py neighboring_window bottom ctrl+j
map ctrl+k kitten pass_keys.py neighboring_window top    ctrl+k
map ctrl+h kitten pass_keys.py neighboring_window left   ctrl+h
map ctrl+l kitten pass_keys.py neighboring_window right  ctrl+l
```

---

## 學習建議

### 第一週：記住這些 ⭐

- `Ctrl+S` - 儲存
- `Ctrl+P` - 開啟檔案
- `Ctrl+B` - 側邊欄
- `Ctrl+H/J/K/L` - 視窗導航
- `Space+/` - 註解
- `gd` - 跳到定義

### 第二週：Buffer 管理

- `]b` / `[b` - 切換 Buffer
- `Space+1-9` - 快速跳轉
- `Space+c` - 關閉 Buffer

### 第三週：進階功能

- `Space+fg` - 全域搜尋
- `Space+ca` - 程式碼操作
- `Space+fm` - 格式化
- `Space+rn` - 重新命名

---

**提示：** 所有快捷鍵都可在 `~/.config/nvim/lua/config/keymaps.lua` 自訂！
