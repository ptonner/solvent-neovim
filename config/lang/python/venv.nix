{ pkgs, lib, ... }:
with lib; {
  extraConfigLuaPre = ''
    require('venv-selector').setup {
      name=".venv"
    }
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>sv";
      action = "<cmd>VenvSelect<cr>";
      options = { desc = "venv"; };
    }
    {
      mode = "n";
      key = "<leader>sV";
      action = "<cmd>VenvSelectCached<cr>";
      options = { desc = "venv (cached)"; };
    }
  ];
  extraPackages = with pkgs; [ fd ];
}
