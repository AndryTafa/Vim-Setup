local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter.setup({
  highlight = {
    enable = true
  },
  indent = { enable = true },
  autotag = { enable = true },
  ensure_installed = {
    "json",
    "javascript",
    "typescript",
    "tsx",
    "yaml",
    "html",
    "css",
    "markdown",
    "svelte",
    "graphql",
    "lua",
    "bash",
    "vim",
    "dockerfile",
    "gitignore",
    "java",
    "rust",
    "c",
    "cpp",
    "vue",
    "xml",
  },
  auto_install = true
})
