vim.cmd('set expandtab')
vim.cmd('set autoindent')
vim.cmd('set smartindent')
vim.cmd('set relativenumber')
vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set softtabstop=2')
vim.g.mapleader = ' '

vim.opt.swapfile = false

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- Movement
vim.api.nvim_set_keymap('n', 'w', 'k', { noremap = true })
vim.api.nvim_set_keymap('n', 's', 'j', { noremap = true })
vim.api.nvim_set_keymap('n', 'a', 'h', { noremap = true })
vim.api.nvim_set_keymap('n', 'd', 'l', { noremap = true })
vim.api.nvim_set_keymap('n', 'q', 'b', { noremap = true }) -- Prev word
vim.api.nvim_set_keymap('n', 'e', 'w', { noremap = true }) -- Next word
vim.api.nvim_set_keymap('n', '<S-a>', '0', { noremap = true }) -- Start of line
vim.api.nvim_set_keymap('n', '<S-d>', '$', { noremap = true }) -- End of line
vim.api.nvim_set_keymap('n', '<S-w>', '{', { noremap = true }) -- Prev block
vim.api.nvim_set_keymap('n', '<S-s>', '}', { noremap = true }) -- Next block

-- Quick comment
vim.api.nvim_set_keymap('n', '<C-/>', ':CommentToggle<CR>', { noremap = true })  -- Toggle comment

-- Move between windows
vim.api.nvim_set_keymap('n', '<Up>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<Down>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<Left>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<Right>', '<C-w>l', { noremap = true })


vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })  -- Copy to clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })  -- Paste from clipboard
vim.api.nvim_set_keymap('n', 'x', 'dd', { noremap = true })   -- Cut

vim.api.nvim_set_keymap('n', 'u', ':undo<CR>', { noremap = true }) -- Undo
vim.api.nvim_set_keymap('n', '<C-r>', ':redo<CR>', { noremap = true }) -- Redo

vim.api.nvim_set_keymap('n', '<S-o>', 'O', { noremap = true })  -- Insert prev line
vim.api.nvim_set_keymap('n', '<S-p>', 'o', { noremap = true })  -- Insert next line

vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })  -- Copy to clipboard
vim.api.nvim_set_keymap('v', 'x', 'd', { noremap = true })    -- Cut
vim.api.nvim_set_keymap('v', 'p', '"+p', { noremap = true })  -- Paste from clipboard

vim.api.nvim_set_keymap('v', 'w', 'k', { noremap = true })  -- Move selection up
vim.api.nvim_set_keymap('v', 's', 'j', { noremap = true })  -- Move selection down
vim.api.nvim_set_keymap('v', 'a', 'h', { noremap = true })  -- Move selection left
vim.api.nvim_set_keymap('v', 'd', 'l', { noremap = true })  -- Move selection right

vim.api.nvim_set_keymap('v', '<S-w>', '{', { noremap = true }) -- Jump block up
vim.api.nvim_set_keymap('v', '<S-s>', '}', { noremap = true }) -- Jump block down

vim.api.nvim_set_keymap('v', '<Tab>', '>gv', { noremap = true }) -- Indent right (Tab) in visual mode
vim.api.nvim_set_keymap('v', '<S-Tab>', '<gv', { noremap = true }) -- Indent left (Shift + Tab) in visual mode

-- Reindent the entire file in normal mode
vim.api.nvim_set_keymap('n', '<leader>r', 'gg=G', { noremap = true, silent = true })
-- Reindent selected lines in visual mode
vim.api.nvim_set_keymap('v', '<leader>r', '=gv', { noremap = true, silent = true })
