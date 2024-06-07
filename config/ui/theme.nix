{ pkgs, lib, ... }:
let
  inherit (lib) readFile;
in
{
  extraPlugins = with pkgs.vimPlugins; [ github-nvim-theme ];
  extraConfigLuaPre = readFile ./theme.lua;
  # colorschemes.onedark = {
  #   enable = true;
  #   settings = {
  #     style = "light";
  #     toggle_style_key = "<leader>ts";
  #   };
  # };
  opts.background = "dark";
  plugins.lualine.enable = true;
  plugins.lualine.theme = "auto";
}
