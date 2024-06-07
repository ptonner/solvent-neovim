{ pkgs, ... }:
{
  plugins = {
    lsp.servers.nixd.enable = true;
    conform-nvim.formattersByFt.nix = [ "nixfmt" ];
  };
  extraPackages = with pkgs; [ nixfmt-rfc-style ];
}
