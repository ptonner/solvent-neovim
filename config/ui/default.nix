{ ... }: {
  imports = [ ./navigation.nix ./neovide.nix ./theme.nix ./which-key.nix ];

  # highlight word at point
  plugins.illuminate.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "[b";
      action = ":bprev<cr>";
      options.desc = "Previous buffer";
    }
    {
      mode = "n";
      key = "]b";
      action = ":bnext<cr>";
      options.desc = "Next buffer";
    }
  ];

}
