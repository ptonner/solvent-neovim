{ pkgs, ... }:
{
  plugins = {
    lsp.servers.rust-analyzer.enable = true;
    lsp.servers.rust-analyzer.installCargo = true;
    lsp.servers.rust-analyzer.installRustc = true;
    conform-nvim.formattersByFt.rust = [ "rustfmt" ];
  };
  extraPackages = with pkgs; [ rustfmt ];
}
