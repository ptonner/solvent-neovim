{ lib, ... }:
with lib; {
  plugins.conform-nvim = {
    enable = true;
    # NOTE: must be set to enable
    formatOnSave = { };
  };
  plugins.none-ls = { enable = true; };
  extraConfigLuaPost = readFile ./conf.lua;
}
