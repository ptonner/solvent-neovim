{ helpers, ... }:
{

  plugins.lsp.enable = true;

  keymaps = [
    {
      mode = "n";
      key = "[d";
      action = helpers.mkRaw "function() vim.diagnostic.goto_prev() end";
      options = {
        desc = "Previous diagnostic";
      };
    }
    {
      mode = "n";
      key = "]d";
      action = helpers.mkRaw "function() vim.diagnostic.goto_next() end";
      options = {
        desc = "Next diagnostic";
      };
    }
    {
      mode = "n";
      key = "gd";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_definitions() end";
      options = {
        desc = "Show the definition of current symbol";
      };
    }
    {
      mode = "n";
      key = "gD";
      action = helpers.mkRaw "function() vim.lsp.buf.declaration() end";
      options = {
        desc = "Declaration of current symbol";
      };
    }
    {
      mode = "n";
      key = "gh";
      action = helpers.mkRaw "function() vim.lsp.buf.signature_help() end";
      options = {
        desc = "Show help for current signature";
      };
    }
    {
      mode = "n";
      key = "gi";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_implementations() end";
      options = {
        desc = "Show implementations of current symbol";
      };
    }
    {
      mode = "n";
      key = "gr";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_references() end";
      options = {
        desc = "Show references of current symbol";
      };
    }
    {
      mode = "n";
      key = "gS";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_document_symbols() end";
      options = {
        desc = "Show current document symbols";
      };
    }
    {
      key = "gt";
      mode = "n";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_type_definitions() end";
      options = {
        desc = "Show the definition of current symbol's type";
      };
    }
    {
      mode = "n";
      key = "K";
      action = helpers.mkRaw "function() vim.lsp.buf.hover() end";
      options = {
        desc = "Hover symbol details";
      };
    }

    {
      mode = "n";
      key = "<leader>la";
      action = helpers.mkRaw "function() vim.lsp.buf.code_action() end";
      options.desc = "LSP code action";
    }
    {
      mode = "n";
      key = "<leader>ld";
      action = helpers.mkRaw "function() vim.diagnostic.open_float() end";
      options.desc = "Hover diagnostics";
    }
    {
      mode = "n";
      key = "<leader>lD";
      action = helpers.mkRaw "function() require('telescope.builtin').diagnostics() end";
      options.desc = "Search diagnostics";
    }
    {
      mode = "n";
      key = "<leader>lR";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_references() end";
      options.desc = "Show references of current symbol";
    }
    {
      key = "<leader>lr";
      mode = "n";
      action = helpers.mkRaw "function() vim.lsp.buf.rename() end";
      options.desc = "Rename current symbol";
    }
    {
      key = "<leader>lh";
      mode = "n";
      action = helpers.mkRaw "function() vim.lsp.buf.signature_help() end";
      options.desc = "Signature help";
    }
    {
      key = "<leader>lf";
      mode = "n";
      action = helpers.mkRaw "function() vim.lsp.buf.format() end";
      options.desc = "Format the buffer";
    }
    {
      key = "<leader>lQ";
      mode = "n";
      action = helpers.mkRaw ''
        function()
        vim.ui.input({ prompt = "Symbol Query: " }, function(query)
        		if query then require('telescope.builtin').lsp_workspace_symbols { query = query } end
        		end)
        end
      '';
      options.desc = "Search workspace symbols";
    }
  ];
}
