{ pkgs, ... }:
let
  search-leader = "<leader>s";
in
{
  extraPackages = with pkgs; [
    ripgrep
    bat
    fd
  ];
  extraPlugins = with pkgs.vimPlugins; [ cder ];
  keymaps = [
    {
      mode = "n";
      key = "<leader>sd";
      action = "<cmd>Telescope cder<cr>";
      options = {
        desc = "directory";
      };
    }
  ];
  plugins.which-key.registrations.${search-leader} = "search";
  plugins = {
    telescope = {
      enable = true;
      settings = {
        pickers = {
          buffers = {
            sort_mru = true;
            ignore_current_buffer = true;
          };
          git_files = {
            recurse_submodules = true;
          };
        };
      };
      keymaps = {
        "<leader>," = {
          action = "buffers";
          options = {
            desc = "buffers";
          };
        };
        "${search-leader}<cr>" = {
          action = "resume";
          options.desc = "resume";
        };
        "${search-leader}b" = {
          action = "buffers";
          options.desc = "buffers";
        };
        "${search-leader}c" = {
          action = "git_commits";
          options.desc = "commits";
        };
        # "${search-leader}d" = {
        #   action = "cder";
        #   options.desc = "directory";
        # };
        "${search-leader}f" = {
          action = "find_files";
          options.desc = "files";
        };
        "${search-leader}F" = {
          action = "oldfiles";
          options.desc = "old files";
        };
        "${search-leader}g" = {
          action = "live_grep";
          options.desc = "grep";
        };
        "${search-leader}G" = {
          action = "git_files";
          options.desc = "git files";
        };
        "${search-leader}H" = {
          action = "help_tags";
          options.desc = "help";
        };
        "${search-leader}j" = {
          action = "jumplist";
          options.desc = "jumps";
        };
        "${search-leader}k" = {
          action = "keymaps";
          options.desc = "keymaps";
        };
        "${search-leader}l" = {
          action = "loclist";
          options.desc = "locations";
        };
        "${search-leader}m" = {
          action = "marks";
          options.desc = "marks";
        };
        "${search-leader}M" = {
          action = "man_pages";
          options.desc = "Man pages";
        };
        "${search-leader}q" = {
          action = "quickfix";
          options.desc = "quickfix";
        };
        "${search-leader}r" = {
          action = "registers";
          options.desc = "registers";
        };
        "${search-leader}R" = {
          action = "lsp_references";
          options.desc = "references";
        };
        "${search-leader}s" = {
          action = "grep_string";
          options.desc = "grep string";
        };
        "${search-leader}S" = {
          action = "lsp_document_symbols";
          options.desc = "symbols";
        };
        "${search-leader}t" = {
          action = "treesitter";
          options.desc = "treesit";
        };
        "${search-leader}z" = {
          action = "current_buffer_fuzzy_find";
          options.desc = "fuzzy";
        };
      };
      extensions.fzf-native.enable = true;
      enabledExtensions = [ "cder" ];
    };
  };

  # extraConfigLuaPost = ''
  #   require('telescope').load_extension('cder')
  # '';
}
