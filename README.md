<h1 align="center">Yet Another Neovim Config</h1>
<br/>
<br/>
<img src="/assets/screenshot.png"><hr>
<div align="center">

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)]() <br/> [![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.6+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)

**NEOVIM code editor configuration with lua, based on configuration by NvChad**

</div>
<hr/>

### Pre requirements 📋

What things do you need to install the software and how to install them

- Neovim +0.6v
- Node
- Python +3.8v
- A terminal that supports [Nerdfonts](https://github.com/ryanoasis/nerd-fonts)
- Colocar el inner padding en 0
- Install [Fzf](https://github.com/junegunn/fzf)
- Install [ripgrep](https://github.com/BurntSushi/ripgrep#installation)

<hr/>
### Installation 🔧

_Se realiza un_

```
#Packer is installed to handle the plugins
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

#Se instala packer para el manejo de los plugins
git clone https://github.com/Yoliani/Neovim-lua.git $HOME/.config/nvim
```

<hr/>

### Despliegue 📦

_Se realiza un:_

```
:PackerInstall

```

### Instalar Language servers

- Install the language you want. For more information check:
- [nvim-lspInstall](https://github.com/kabouzeid/nvim-lspinstall)

```
ejemplo -:LspInstall html
```

<hr/>
<br/>

## Features

- Async plugins load
- Fast plugin loading.
- File navigation with nvim-tree.lua.
- Managing tabs, buffers with bufferline.nvim.
- Beautiful and configurable icons with nvim-web-devicons.
- Pretty and functional statusline with feline.nvim.
- Git diffs and more with gitsigns.nvim .
- NeoVim Lsp configuration with nvim-lspconfig.
- Autocompletion with nvim-cmp.
- File searching, previewing image and text files and more with telescope.nvim.
- Syntax highlighting with nvim-treesitter.
- Autoclosing braces and html tags with nvim-autopairs.
- Indentlines with indent-blankline.nvim.
- Useful snippets with LuaSnip and Vsnip.

<br/>

## TODO

- Global config
- Windows branch

<br/>

## Restrictions

- Linux only

    <br/>

## Built with 🛠️

_For the development of this NEOVIM configuration, lua were used as a base, and
the following repositories were used as a base:_

- [NvChad](https://github.com/NvChad/NvChad) - Se basa en parte en esta configuracion

## Authors ✒️

- **Edgardo Yoliani** - _Initial Work and Documentation_ - [Yoliani](https://github.com/Yoliani)
