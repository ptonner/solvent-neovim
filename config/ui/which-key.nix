{ ... }: {
  plugins.which-key.enable = true;
  plugins.which-key.registrations = {
    "\\" = "+localleader";
    "<leader>l" = "+LSP";
    "<leader>g" = "+git";
    "<leader>t" = "+toggle";
    "<leader>i" = "+insert";
  };
}
