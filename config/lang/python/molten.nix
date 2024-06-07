{ lib, ... }:
with lib;
{
  plugins = {
    # NOTE: currently requires a call to `UpdateRemotePlugins` to initialize
    molten = {
      enable = true;
      settings = {
        imageProvider = "image.nvim";
        autoOpenOutput = false;
        output_virt_lines = true;
      };
    };
    image = {
      enable = false;
      backend = "kitty";
      # backend = "ueberzug";
      maxWidth = 120;
      maxHeight = 18;
      windowOverlapClearEnabled = true;
      # NOTE: couldn't set to math.huge like recommended in docs
      maxWidthWindowPercentage = 10000;
      maxHeightWindowPercentage = 10000;
      # tmuxShowOnlyInActiveWindow = true;
    };
  };
  extraConfigLuaPre = ''
    vim.api.nvim_create_user_command(
      'MoltenInitKernelFile',
      function()
        local kfile = vim.fn.input("Kernel file: ", "kernel.json", "file")
        vim.cmd("MoltenInit " .. kfile)
      end,
      {}
    )
  '';
  extraPython3Packages =
    p: with p; [
      jupyter-client
      jupyter
    ];
  extraFiles = {
    "after/ftplugin/python.lua" = readFile ./ftplugin.lua;
  };
}
