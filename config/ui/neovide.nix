{ ... }: {
  globals.neovide_cursor_animation_length = 2.5e-2;
  globals.neovide_scroll_animation_length = 0.1;
  opts.guifont = "FiraCode_Nerd_Font:h20";
  extraConfigLuaPost = ''
    if vim.g.neovide then
      vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
      vim.keymap.set('v', '<D-c>', '"+y') -- Copy
      vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
      vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
      vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
      vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
    end
  '';
}
