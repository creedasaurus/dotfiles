
-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

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
  -- use {'nvim-treesitter/nvim-treesitter'}
--   use 'tpope/vim-vinegar'
  use 'tpope/vim-surround'
--   use 'tpope/vim-fugitive'
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
--   use 'neovim/nvim-lspconfig'
--   use 'bfredl/nvim-luadev'
--   use 'hrsh7th/nvim-compe'
--   use 'sbdchd/neoformat'
  -- use 'Olical/aniseed'
  -- use 'Olical/conjure'
end)

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

