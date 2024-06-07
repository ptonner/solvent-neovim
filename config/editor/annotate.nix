{ ... }: {
  plugins = {
    neogen = {
      enable = true;
      keymaps = { generate = "<leader>id"; };
      languages = {
        python = { template = { annotation_convention = "numpydoc"; }; };
      };
    };
  };
}
