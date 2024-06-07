require('github-theme').setup({
  options = {
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'italic,bold',
    }
  },
  github_dark_default = {
    gray = {
      base = '#000000',
      bright = '#000000',
    },
  },
})

-- vim.cmd('colorscheme github_light')
-- vim.cmd('colorscheme github_dark')
vim.cmd('colorscheme github_dark_default')
