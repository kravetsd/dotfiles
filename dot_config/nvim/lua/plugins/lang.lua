return {
  -- LazyVim language extras
  { import = "lazyvim.plugins.extras.lang.python" },    -- pyright + ruff
  { import = "lazyvim.plugins.extras.lang.yaml" },      -- yaml-language-server
  { import = "lazyvim.plugins.extras.lang.terraform" }, -- terraform-ls
  { import = "lazyvim.plugins.extras.lang.docker" },    -- dockerfile-language-server
  { import = "lazyvim.plugins.extras.lang.go" },        -- gopls
  { import = "lazyvim.plugins.extras.lang.json" },      -- jsonls
  { import = "lazyvim.plugins.extras.lang.markdown" },  -- marksman

  -- bash-language-server (no LazyVim extra available)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
        helm_ls = {
          settings = {
            ["helm-ls"] = {
              yamlls = { path = "yaml-language-server" },
            },
          },
        },
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "bash-language-server", "helm-ls" })
    end,
  },
}
