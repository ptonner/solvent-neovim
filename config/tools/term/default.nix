{ ... }: {
  plugins.toggleterm = {
    enable = true;
    settings = {
      direction = "horizontal";
      open_mapping = "[[<m-t>]]";
      shadingFactor = -1;
    };
  };

  # NOTE: stupid idea to have a neofetch toggled screen, currently don't know
  # how to make the floating terminal stay open after neofetch exits

  # extraConfigLua = ''
  #   local Terminal  = require('toggleterm.terminal').Terminal
  #   local neofetch = Terminal:new({
  #     cmd = "neofetch",
  #     dir = "git_dir",
  #     direction = "float",
  #     float_opts = {
  #       border = "double",
  #     },
  #     -- function to run on opening the terminal
  #     on_open = function(term)
  #       vim.cmd("startinsert!")
  #       vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  #     end,
  #     -- function to run on closing the terminal
  #     on_close = function(term)
  #       vim.cmd("startinsert!")
  #     end,
  #   })
  #
  #   function _neofetch_toggle()
  #     neofetch:toggle()
  #   end
  # '';
}
