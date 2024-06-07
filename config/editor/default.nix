{ pkgs, lib, ... }:
let
  inherit (lib) readFile;
in
{
  imports = [ ./annotate.nix ];
  plugins = {
    surround.enable = true;
    nvim-autopairs.enable = true;
    comment.enable = true;
    todo-comments = {
      enable = true;
      signs = false;
      keywords = {
        REF = {
          color = "info";
        };
      };
    };
  };

  clipboard = {
    register = "unnamedplus";
  };
  extraPlugins = with pkgs.vimPlugins; [ unicode-vim ];

  extraConfigLua = readFile ./conf.lua;

  keymaps = [
    {
      mode = "n";
      key = "<c-d>";
      action = "<c-d>zz";
    }
    {
      mode = "n";
      key = "<c-u>";
      action = "<c-u>zz";
    }
    {
      mode = "n";
      key = "<leader>i.";
      action = ":put =strftime('%Y%m%d')<cr>I<bs><esc>";
      options.desc = "date";
    }
  ];
}
