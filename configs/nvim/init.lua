
-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

-- If you use asdf, set the path to python versions
-- vim.g.python3_host_prog = vim.env.HOME .. '/.asdf/installs/python/3.9.4/bin/python'
-- vim.g.python_host_prog = vim.env.HOME .. '/.asdf/installs/python/2.7.18/bin/python'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {'nvim-treesitter/nvim-treesitter'}
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use 'simrat39/rust-tools.nvim'
  use 'RishabhRD/popfix'
  use 'neovim/nvim-lspconfig'
  use 'RishabhRD/nvim-lsputils'
  use 'nvim-lua/completion-nvim'
--   use 'tpope/vim-vinegar'
  use 'tpope/vim-surround'
--   use 'tpope/vim-fugitive'
  use 'ipkiss42/xwiki.vim.git'
--   use 'tpope/vim-rhubarb'
--   use 'tpope/vim-dispatch'
--   use 'tpope/vim-repeat'
--   use 'tpope/vim-sleuth'
--   use 'tpope/vim-eunuch'
--   use 'tpope/vim-unimpaired'
--   use 'tpope/vim-commentary'
--   use 'norcalli/snippets.nvim'
--   use { 'glacambre/firenvim', run = ":call firenvim#install(0)" }
--   use 'AndrewRadev/splitjoin.vim'
--   use 'ludovicchabant/vim-gutentags'
  use 'junegunn/vim-easy-align'
--   use {'nvim-telescope/telescope.nvim',
--   requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
--   }
--   use 'justinmk/vim-dirvish'
  use 'joshdick/onedark.vim'
  use 'itchyny/lightline.vim'
  -- use {
  -- 'glepnir/galaxyline.nvim',
  --   branch = 'main',
  --   -- your statusline
  --   -- config = function() require'my_statusline' end,
  --   -- some optional icons
  --   requires = {'kyazdani42/nvim-web-devicons', opt = true}
-- }
--   use 'christoomey/vim-tmux-navigator'
--   use { 'lervag/vimtex', ft = {'tex'} }
--   use 'mhinz/neovim-remote'
  use { 'lukas-reineke/indent-blankline.nvim', branch="lua" }
--   use 'sheerun/vim-polyglot'
--   use 'jpalardy/vim-slime'
--   use 'hkupty/iron.nvim.git'
--   use 'lewis6991/gitsigns.nvim'
--   use 'bfredl/nvim-luadev'
--   use 'hrsh7th/nvim-compe'
--   use 'sbdchd/neoformat'
  -- use 'Olical/aniseed'
  -- use 'Olical/conjure'
end)

-- Treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "javascript",
        "typescript",
        "go",
        "html",
        "css",
        "bash",
        "lua",
        "json"
        --  "cpp",
        --   "rust",
        --   "python"
    },
    highlight = {
        enable = true,
        use_languagetree = true
    }
}

local completion = require('completion')

local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  print('on attached!')
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  completion.on_attach(client, bufnr)
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {"gopls", "rust_analyzer", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end


nvim_lsp.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" , "--log-level=3" }
}

-- vim.api.nvim_command('')

--Expand tab to spaces
vim.o.expandtab = true

--Make line numbers default
vim.wo.number = true

--Enable mouse mode
vim.o.mouse = "a"

--Save undo history
vim.cmd[[ set undofile ]]

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.cmd[[colorscheme onedark]]


--Set statusbar
vim.g.lightline = { colorscheme = 'onedark';
      active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } };
      component_function = { gitbranch = 'fugitive#head', };
}


vim.g.indent_blankline_char = "┊"
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile'}
vim.g.indent_blankline_char_highlight = 'LineNr'

