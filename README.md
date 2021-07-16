
<h1 align="center">Yoliani-Neovim</h1>

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blueviolet.svg?style=for-the-badge&logo=lua)]() [![Neovim Minimum Version](https://img.shields.io/badge/Neovim-0.5+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim)


__Configuración del editor de codigo NEOVIM con lua, basado en la configuración de NcChad, donde se implementan más snippets, implementacion de Kite y Tabnine, a su vez tiene un ciclador de tema con cierta "keybind".__
<img src="/assets/dashboard.png"><hr>

### Pre-requisitos 📋

_Que cosas necesitas para instalar el software y como instalarlas_


- Neovim +0.5v
- Python +3.8v
- Una terminal que soporte [nerdfont](https://github.com/ryanoasis/nerd-fonts)
- Colocar el inner padding en 0.
- Instalar [Fzf](https://github.com/junegunn/fzf) y [ripgrep](https://github.com/BurntSushi/ripgrep#installation)


### Instalación 🔧

_Se realiza un_ 
```
#Se instala packer para el manejo de los plugins
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/Yoliani/Neovim-lua.git
```


### Despliegue 📦
_Se realiza un:_


```
:PackerInstall

```

_Dentro de NEOVIM para instalar todos los plugins_

_Aún hay que instalar ciertos requerimientos, los cuales se encontraran en_

```
#~/.local/share/nvim/site/pack/packer/start
#El primero seria vim-shoot plugin utilizado para tomar capturas al codigo.
#Se escribe en la terminal lo siguiente
python3 ~/.local/share/nvim/site/pack/packer/start/vim-shoot/install.py chromedriver

#Lo segundo por hacer seria instalar los requerimientos de Bracey.nvim
npm install --prefix server

```

### Instalar Lsp servers
- Instala el lenguaje que tu quieras. Para más información revisa [nvim-lspInstall](https://github.com/kabouzeid/nvim-lspinstall)


```
ejemplo -:LspInstall html
```


## Caracteristicas 
- Navegar por los archivos con Nvimtree.
- Ciclar temas con una combinaciión de teclas.
- Manejo de tabs y buffers con bufeerline.
- Autoguardado.
- Iconos en Nvimtree, telescope, bufferline/statusline.
- Uso de nvim-lsp.
- lspInstall para instalar servidores facilmente.
- packer.nvim como gestor de paquetes.
- Multiples snippets.
- Formateo de codigo.
- telescope para buscar archivos, vista previa, etc.
- Implementación de Tabnine y Kite con lsp y compe-completion.
- Statusline minimalista.
- Autopairs
- Lineas de identación.
- Ver diferencias entre los archivos con diffview.
- Termianl flotante Fterm.
- Iluminar codigo que se este escribiendo, y opacar el codigo que no esta seleccionado. 
```
#Para activarlo se usa: 
:TwilightEnable 
```




## TODO 
- Ampliar los sistemas operativos compatibles.
- Una configuración global.
- Una función para reiniciar la configuración de NEOVIM cuando se realice un cambio al .config/nvim/

## Restricciones
* Actualmente solo puede ser usado en linux.

## Construido con 🛠️

_Para el desarrollo de esta configuración de NEOVIM se utilizo vim scripting y lua como base, y se utilizaron los siguientes repositorios como base:_

* [NvChad](https://github.com/siduck76/NvChad) - Se basa en parte en esta configuracion

## Autores ✒️

* **Edgardo Yoliani** - *Trabajo Inicial y Documentación* - [Yoliani](https://github.com/Yoliani)


También puedes mirar la lista de todos los [contribuyentes](https://github.com/your/project/contributors) quíenes han participado en este proyecto. 










