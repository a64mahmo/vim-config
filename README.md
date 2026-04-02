# Neovim Config

Personal Neovim config based on kickstart.nvim, restructured into modular files.

## Structure

```
init.lua                  # Entry point — sets leaders, loads core, bootstraps lazy
lua/
  core/
    options.lua           # Editor options (line numbers, scroll, etc.)
    keymaps.lua           # Base keymaps (not plugin-specific)
    autocmds.lua          # Autocommands (e.g. yank highlight)
  plugins/                # One file per plugin — lazy auto-loads all of these
    colorscheme.lua       # tokyonight-night
    telescope.lua         # Fuzzy finder + keymaps
    lsp.lua               # LSP (nvim-lspconfig + mason + lazydev)
    completion.lua        # Autocompletion (blink.cmp + luasnip)
    treesitter.lua        # Syntax highlighting
    formatting.lua        # Auto-format on save (conform.nvim)
    mini.lua              # mini.ai, mini.surround, mini.statusline
    which-key.lua         # Keymap hints popup
    neo-tree.lua          # File tree (toggle with \, NOT auto-opened)
    gitsigns.lua          # Git signs + hunk keymaps
    autopairs.lua         # Auto-close brackets/quotes
    lint.lua              # Linting (nvim-lint)
    indent-line.lua       # Indent guides
    transparent.lua       # Transparent background
    todo-comments.lua     # Highlight TODO/FIXME comments
    guess-indent.lua      # Auto-detect indentation
```

## Customization

### Add a new plugin
Create a new file in `lua/plugins/your-plugin.lua` returning a lazy.nvim spec:
```lua
return {
  'author/plugin-name',
  opts = {},
}
```
Lazy will pick it up automatically on next start.

### Add an LSP server
Edit `lua/plugins/lsp.lua` and add to the `servers` table:
```lua
local servers = {
  gopls = {},
  pyright = {},
  ts_ls = {},
  rust_analyzer = {},
  lua_ls = { ... },
}
```
Mason will auto-install it.

### Add a formatter
Edit `lua/plugins/formatting.lua` under `formatters_by_ft`:
```lua
formatters_by_ft = {
  lua = { 'stylua' },
  python = { 'black' },
  javascript = { 'prettierd' },
},
```

### Add a linter
Edit `lua/plugins/lint.lua` under `linters_by_ft`:
```lua
lint.linters_by_ft = {
  markdown = { 'markdownlint' },
  python = { 'pylint' },
}
```

### Change colorscheme
Edit `lua/plugins/colorscheme.lua`. Change the plugin repo and `vim.cmd.colorscheme` call.

### Enable Nerd Font icons
In `init.lua`, set:
```lua
vim.g.have_nerd_font = true
```

## Key Bindings

`<leader>` = Space

| Key | Action |
|-----|--------|
| `\` | Toggle file tree (neo-tree) |
| `<leader>pv` | Open netrw file explorer |
| `<leader>sf` | Search files |
| `<leader>sg` | Live grep |
| `<leader>sh` | Search help |
| `<leader>s.` | Recent files |
| `<leader><leader>` | Open buffers |
| `<leader>f` | Format buffer |
| `<leader>q` | Quickfix diagnostics |
| `<leader>th` | Toggle inlay hints |
| `grn` | LSP rename |
| `grd` | Go to definition |
| `grr` | Go to references |
| `gra` | Code action |
| `]c` / `[c` | Next/prev git hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hb` | Git blame line |

## Plugin Management

```
:Lazy          # Open plugin manager
:Lazy update   # Update all plugins
:Mason         # Open Mason (LSP/tool installer)
:checkhealth   # Diagnose issues
```
