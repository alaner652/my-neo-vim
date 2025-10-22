# Neovim 快捷鍵筆記

`<leader>` 設為空白鍵。以下依使用情境列出實用鍵位，幾乎都來自 `lua/config/keymaps.lua`，照表練習很快就能習慣。

## 1. 常用基礎

- `Normal <leader>fs`：儲存目前檔案。
- `Normal <leader>fq` / `<leader>fQ`：關閉視窗 / 強制離開整個 Neovim。
- `Normal <leader>sa`：快速全選整個檔案（終端環境取代 `Cmd+A`）。
- `Normal <Esc>`：清除搜尋高亮。
- `Normal <leader>/`：切換註解（Comment.nvim）。

## 2. 編輯與縮排

- `Visual <Tab>` / `<S-Tab>`：選取區塊向右 / 向左縮排。
- `Normal >` / `<`：目前行增加 / 減少縮排。
- `Normal <leader>fm`：格式化目前檔案。
- `Visual <leader>fm`：格式化所選範圍。

## 3. 視窗操作

- `Normal <leader>wh/wj/wk/wl`：在分割視窗間移動。
- `Normal <leader>v` / `<leader>h`：建立垂直 / 水平分割。
- `Normal <leader>x`：關閉目前視窗。
- `Normal <leader>=`：視窗尺寸平均分配。
- `Normal <leader>-` / `<leader>+`：視窗高度減少 / 增加 5 行。
- `Normal <leader><` / `<leader>>`：視窗寬度減少 / 增加 5 列。

## 4. 檔案與 Buffer

- `Normal <leader>ff`：Telescope 搜尋檔案。
- `Normal <leader>fg`：Telescope 全域搜尋（ripgrep）。
- `Normal <leader>fb` / `<leader>fr`：列出開啟中的 buffer / 最近使用檔案。
- `Normal <leader>e` / `<leader>E`：開關 Neo-tree / 在側邊欄定位目前檔案。
- `Normal ]b` / `[b`：切換下一個 / 上一個 buffer。
- `Normal <leader>bd` / `<leader>bo`：關閉目前 buffer / 關閉其他 buffer。

## 5. LSP 與診斷

- `Normal gd` / `gD` / `gi`：跳到定義 / 聲明 / 實作。
- `Normal gr`：列出所有引用。
- `Normal K`：顯示符號說明。
- `Normal <leader>rn` / `<F2>`：重新命名符號（保留硬體鍵備援）。
- `Normal <leader>ca`：呼叫 Code Action。
- `Normal [d` / `]d`：上一個 / 下一個診斷訊息。
- `Normal <leader>d` / `<leader>dl`：顯示浮動診斷 / 推送到 loclist 方便巡覽。

## 6. 更多工具

- `Normal <leader>fq` 之後可接 `:quitall`（`<leader>fQ` 已綁定），適合快速清場。
- `:verbose map {key}`：查詢某個快捷鍵是否被覆寫；出現問題時很方便。
