(module dotfiles 
  {require {nvim aniseed.nvim
            mapping dotfiles.mapping
            plugins plugins.nerdTree
            plugins plugins.bufferline-config
            plugins plugins.lualine 
            }})


(set nvim.g.maplocalleader " ")
(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")
(set nvim.o.clipboard "unnamedplus")
(set nvim.w.number  true)
;(vim.g.vscode_style "dark")
(set nvim.o.updatetime 100)
(nvim.ex.colorscheme :nightfox)
(nvim.ex.highlight "NormalFloat ctermbg=grey guibg=grey")

(mapping.setup)

(module plugins)
(require :plugins)

