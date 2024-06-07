{ pkgs, lib, system, ... }:
with lib;

{
  # TODO: check integration with molten

  extraFiles = { "after/ftplugin/quarto.lua" = readFile ./ftplugin.lua; };
  extraConfigLuaPost = ''
        local quarto = require("quarto")
          quarto.setup({
    	  lspFeatures = {
    	      languages = { "python" },
    	      chunks = "all",
    	      diagnostics = {
    		  enabled = true,
    		  triggers = { "BufWritePost" },
    	      },
    	      completion = {
    		  enabled = true,
    	      },
    	  },
    	  keymap = {
    	      hover = "K",
    	      definition = "gd",
    	      rename = "<leader>rn",
    	      references = "gr",
    	      format = "<leader>gf",
    	  },
    	  codeRunner = {
    	      enabled = true,
    	      default_method = "molten",
    	  },
        })
  '';

  extraPlugins = with pkgs.vimPlugins; [ nvim-quarto nvim-otter ];
  # plugins.image.integrations.markdown.filetypes = [ "markdown" "quarto" ];
  # plugins.image.extraOptions = {
  #   integrations = {
  #     markdown = {
  #       enabled = true;
  #       clear_in_insert_mode = false;
  #       download_remote_images = true;
  #       only_render_image_at_cursor = false;
  #       filetypes = [ "markdown" "vimwiki" "quarto" ];
  #     };
  #   };
  # };

  plugins.cmp.settings.sources = [{
    name = "otter";
    priority = 1001;
  }];
}
