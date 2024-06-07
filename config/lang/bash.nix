{ pkgs, ... }: {
  extraPackages = with pkgs; [ shellcheck ];
  extraPlugins = with pkgs.vimPlugins; [ vim-shellcheck ];
}
