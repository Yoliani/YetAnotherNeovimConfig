" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/edgardoyoliani/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/edgardoyoliani/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/edgardoyoliani/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/edgardoyoliani/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/edgardoyoliani/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["Navigator.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0" },
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/Navigator.nvim"
  },
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["ariake-vim-colors"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/ariake-vim-colors"
  },
  ["boo-colorscheme-nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/boo-colorscheme-nvim"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/bracey.vim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/compe-tabnine"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/dashboard-nvim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/dial.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  edge = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/edge"
  },
  ["flutter-tools.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/flutter-tools.nvim"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/format.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gloombuddy = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/gloombuddy"
  },
  ["gruvbox.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["java-syntax.vim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/java-syntax.vim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["modus-theme-vim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/modus-theme-vim"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/moonlight.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nisha-vim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nisha-vim"
  },
  ["nvcode-color-schemes.vim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvcode-color-schemes.vim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-base16.lua"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-base16.lua"
  },
  ["nvim-bufferline.lua"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-comment"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-comment"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-deus"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-deus"
  },
  ["nvim-highlite"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-highlite"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-rdark"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-rdark"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  onebuddy = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/onebuddy"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["presence.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/presence.nvim"
  },
  ["rest.nvim"] = {
    config = { "\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14rest-nvim\frequire\0" },
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/rest.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  sonokai = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/sonokai"
  },
  spacebuddy = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/spacebuddy"
  },
  ["startuptime.vim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/startuptime.vim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/todo-comments.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-auto-save"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-auto-save"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-equinusocio-material"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-equinusocio-material"
  },
  ["vim-go"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-go"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-shoot"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-shoot"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/edgardoyoliani/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: twilight.nvim
time("Config for twilight.nvim", true)
try_loadstring("\27LJ\2\2:\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time("Config for twilight.nvim", false)
-- Config for: orgmode.nvim
time("Config for orgmode.nvim", true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\forgmode\frequire\0", "config", "orgmode.nvim")
time("Config for orgmode.nvim", false)
-- Config for: todo-comments.nvim
time("Config for todo-comments.nvim", true)
try_loadstring("\27LJ\2\2?\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time("Config for todo-comments.nvim", false)
-- Config for: Navigator.nvim
time("Config for Navigator.nvim", true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14Navigator\frequire\0", "config", "Navigator.nvim")
time("Config for Navigator.nvim", false)
-- Config for: FTerm.nvim
time("Config for FTerm.nvim", true)
try_loadstring("\27LJ\2\0023\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time("Config for FTerm.nvim", false)
-- Config for: rest.nvim
time("Config for rest.nvim", true)
try_loadstring("\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14rest-nvim\frequire\0", "config", "rest.nvim")
time("Config for rest.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
