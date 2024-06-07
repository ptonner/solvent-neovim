{ lib, pkgs, ... }:
with lib;
{

  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = ":InspectTree<cr>";
    }
  ];
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      indent = true;
      incrementalSelection = {
        enable = true;
        keymaps = {
          initSelection = "<C-space>";
          nodeIncremental = "<C-space>";
          nodeDecremental = "<bs>";
        };
      };
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        bash
        c
        clojure
        dockerfile
        gdscript
        gitcommit
        gitignore
        # groovy
        html
        java
        javascript
        json
        julia
        latex
        lua
        make
        markdown
        matlab
        nix
        norg
        python
        r
        rust
        sql
        toml
        yaml
        vim
        vimdoc
      ];
    };
    treesitter-context.enable = true;
    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = {
            query = "@class.inner";
            desc = "Select inner part of a class region";
          };
          "as" = {
            query = "@scope";
            queryGroup = "locals";
            desc = "Select language scope";
          };
        };
      };
    };
  };
}
