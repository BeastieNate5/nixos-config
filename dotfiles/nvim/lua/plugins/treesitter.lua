return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function() 
  local status_ok, configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end
  configs.setup({
    ensure_installed = {"rust", "cpp", "python", "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline"},
    sync_install = false,
    highlight = { enable = true },
    indent = { enable = true }
  })
  end
}
