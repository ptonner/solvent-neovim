{ pkgs, lib, ... }:
with lib; {
  imports = [ ./molten.nix ./venv.nix ];
  plugins = {
    lsp = { servers.pyright.enable = true; };
    none-ls = {
      sources.formatting.black.enable = true;
      sources.formatting.isort.enable = true;
    };
  };
  extraPlugins = with pkgs.vimPlugins; [ venv-selector ];
  extraPackages = with pkgs; [ black isort ];
  extraFiles = {
    # add jupyter cell for execution:
    # REF: https://stackoverflow.com/questions/76971646/treesitter-text-object-to-capture-jupyter-cell-expression
    "after/queries/python/textobjects.scm" = readFile ./textobjects.scm;
  };
}
