
# 基本操作

## モード切り替え・保存

- `jj` / `kk` (insert): ESCしてファイル保存
- `<C-g>` (insert): ESCしてファイル保存
- `;` (normal/visual): `:` にマッピング（コマンドモード）

## クリップボード

- `<Space>y` (normal/visual): クリップボードへコピー
- `<Space>d` (normal/visual): クリップボードへ切り取り
- `<Space>p` (normal/visual): クリップボードからペースト

## 行移動・タブ

- `<C-S-j>` (normal/visual): 行を下へ移動
- `<C-S-k>` (normal/visual): 行を上へ移動
- `<C-t>`: 次のタブへ切り替え

## その他

- `<Space>say`: カーソル下の単語を読み上げる

# LSP

- `K`: ホバー情報を表示
- `gd`: 定義へジャンプ
- `gt`: タグスタックを戻る
- `gf`: フォーマット
- `gr`: 参照一覧を表示
- `gn`: シンボルをリネーム
- `<Space>ca`: コードアクション
- `<Space>e`: 診断情報をフロートで表示
- `[d`: 前の診断へ移動
- `]d`: 次の診断へ移動
- `qq`: 診断情報をquickfixリストで表示

# nvim-tree

- `<Leader>nt`: nvim-treeのペインをトグル
- `<Leader>nf`: nvim-treeへフォーカス
- `<Leader>ns`: 開いているファイルをnvim-treeで表示
- `<Leader>nc`: 開いたフォルダを閉じる
- `<C-n>wu`: ツリーペインの幅を +10
- `<C-n>wd`: ツリーペインの幅を -10
- `<Leader>q`: nvim-treeを閉じてquit

# diff-view

- `<Leader>gf`: ファイルの変更履歴確認
- `<Leader>gc`: diffの画面を閉じる
- `<Leader>gd`: コンフリクト解消画面表示
- `<Leader>gh`: 1つ前とのdiff表示

# barbar

- `<C-b>c`: bufferを閉じる
- `<C-b>s`: bufferをソートする
- `<C-h>`: 1つ前のbufferを選択
- `<C-l>`: 1つ後ろのbufferを選択
- `<C-b>a`: 開いているbuffer以外を閉じる

# telescope

- `<Leader>ff`: ファイル検索
- `<Leader>fg`: 文字列検索
- `<Leader>fb`: バッファ検索
- `<Leader>fh`: ヘルプ検索

# toggleterm

- `<Leader>tt`: ターミナルをトグル
- `<Leader>lg` / `<Leader>gg`: lazygitを起動
- `<Leader>tp`: Python REPLを起動
- `<Leader>to`: oxker（Dockerコンテナ管理）を起動

# hop

- `<Leader>jj` / `<Leader>jw`: 単語単位でジャンプ (HopWord)
- `<Leader>jl`: 行単位でジャンプ (HopLine)

# dropbar

- `<Leader>;`: winbarのシンボルを選択してジャンプ
- `[;`: 現在のコンテキストの先頭へ移動
- `];`: 次のコンテキストを選択

# namu

- `<Leader>ss`: LSPシンボルへジャンプ
- `<Leader>th`: カラースキーム選択

# minimap

- `<Leader>mo`: ミニマップを開く
- `<Leader>mc`: ミニマップを閉じる

# csvview

- `<Leader>ct`: CSV表示モードをトグル
- `<Leader>ww`: 折り返し表示を有効化
- `<Leader>wn`: 折り返し表示を無効化

# dial

- `<C-a>`: カウントアップ
- `<C-x>`: カウントダウン

# which-key

- `<Leader>?`: バッファローカルのキーマップ一覧を表示

# lazy.nvim

- `<Leader>lu`: プラグインをアップデート
- `<Leader>ls`: プラグインをsync

# other

- `<Leader>cp` / `<Leader>y`: 開いているファイルのパスをコピーする

