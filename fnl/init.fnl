(module dotfiles 
  {require {nvim aniseed.nvim
            mapping dotfiles.mapping
            plugins plugins.nerdTree
            }})


(set nvim.g.maplocalleader " ")
(set nvim.o.termguicolors true)
(set nvim.o.mouse "a")

(nvim.ex.colorscheme :gruvbox)
(nvim.ex.highlight "NormalFloat ctermbg=grey guibg=grey")

(mapping.setup)

