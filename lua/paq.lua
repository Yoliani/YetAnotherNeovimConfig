
-- Auto install if not exist
local install_path = vim.fn.stdpath('data')..'/site/pack/paqs/opt/paq-nvim'

if fn.empty(vim.fn.glob(install_path)) > 1 then
  cmd('!git clone --depth 2 https://github.com/savq/paq-nvim.git '..install_path)
end

-- Load the plugin manager
cmd 'packadd paq-nvim'

-- Set the short hand
local plug = require('paq-nvim').paq

-- Make paq manage it self
plug {'savq/paq-nvim', opt=true}


require"paq-plugs"
