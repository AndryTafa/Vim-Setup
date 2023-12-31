local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
  return
end

return packer.startup(function(use)
  use("wbthomason/packer.nvim")
  use("nvim-lua/plenary.nvim")

  -- preferred colour scheme
  use("bluz71/vim-nightfly-guicolors")

  -- tmux & split window navigation
  use("christoomey/vim-tmux-navigator") -- note: for some reason this isn't working
  use("wfxr/minimap.vim")
  use("szw/vim-maximizer") -- maximizes and restores current window

  -- essential plugins
   use("tpope/vim-surround")
   use("vim-scripts/ReplaceWithRegister")

   -- commenting with gc
   use("numToStr/Comment.nvim")

   -- file explorer
   use("nvim-tree/nvim-tree.lua")

   -- nerd font icons 
   use("ryanoasis/vim-devicons")

   -- icons
   use("kyazdani42/nvim-web-devicons")

   -- statusLine
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }

  -- fuzzy finding
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

  -- auto completion
   use("hrsh7th/nvim-cmp")
   use("hrsh7th/cmp-buffer")
   use("hrsh7th/cmp-path")

  -- snippets
  use("L3MON4D3/LuaSnip")
  use("saadparwaiz1/cmp_luasnip")
  use("rafamadriz/friendly-snippets")

  -- managing and installing lsp server, linters & formatters
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp servers
  use("neovim/nvim-lspconfig")
  use("hrsh7th/cmp-nvim-lsp") -- allow lsp suggestion in autocomplete
  use({ "glepnir/lspsaga.nvim", branch = "main" }) -- add ui for lsp
  use("jose-elias-alvarez/typescript.nvim") -- add further typescript server functionality (e.g. renaming file and updating all its imports)
  use("onsails/lspkind.nvim") -- used to add vscode like icons to autocomplete

  -- formatting and linting
  use("jose-elias-alvarez/null-ls.nvim")
  use("jayp0521/mason-null-ls.nvim")

  -- treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function ()
      require("nvim-treesitter.install").update({ with_sync = true })
    end
  })

  -- auto closing
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")

  -- git signs plugin
  use("lewis6991/gitsigns.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
