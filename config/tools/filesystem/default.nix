{ pkgs, helpers, ... }:
{
  plugins = {
    oil = {
      enable = true;
      settings = {
        keymaps = {
          # "<leader>." = "action.open_float"; 
        };
      };
    };
  };
  keymaps = [
    {
      key = "<leader>.";
      action = helpers.mkRaw "function() require('oil').open_float() end";
      options.desc = "files";
    }
  ];
  extraPackages = with pkgs; [ eza ];
}
