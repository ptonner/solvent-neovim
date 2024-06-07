{ pkgs, ... }:

{
  extraPlugins = with pkgs.vimPlugins; [ nvim-nextflow ];
}
