{ lib, system, ... }:
with lib;
{
  imports = [
    ./editor
    ./lang
    ./tools
    ./ui
  ];

  config.globals.mapleader = " ";
  config.globals.maplocalleader = "\\";

  config.opts = {
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    exrc = true;
  };
}
