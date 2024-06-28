{ pkgs, ... }:
{
  plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [ nickel ];
  plugins.lsp.servers.nickel-ls = {
    enable = true;
  };
  extraPackages = with pkgs; [ nickel ];

  extraPlugins = with pkgs.vimPlugins; [ vim-nickel ];
}
