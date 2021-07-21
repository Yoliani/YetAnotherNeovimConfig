local async 
async = vim.loop.new_async(
  vim.schedule_wrap(
      function()
        require('settings')
        require('pluginList')
        require('plugins')
        require('mappings')
      end
    )


  )
async:send()
