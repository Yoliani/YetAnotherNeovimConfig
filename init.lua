--require"settings"

local async

async =
   vim.loop.new_async(
      vim.schedule_wrap(
         function ()
            require("pluginList")
            require("settings")
            require("utils")
            require("plugins")
            require("mappings")
	    vim.cmd("source $HOME/.config/nvim/plugins/kite.vim")
	    vim.cmd("source $HOME/.config/nvim/plugins/jdtls.vim")
	    vim.cmd([[if has('nvim-0.6')
 			 augroup lsp
   			 au!
		    	  au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
  			 augroup end
		      endif]])
         end
   )
)
async:send() 


