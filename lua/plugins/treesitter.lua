return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"lua", "nix", "css", "bash", "json", "toml", "python"},
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
