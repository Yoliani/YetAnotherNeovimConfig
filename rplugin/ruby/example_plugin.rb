# ~/.config/nvim/rplugin/ruby/example_plugin.rb

Neovim.plugin do |plug|
  # Define a command called "SetLine" which sets the contents of the current
  # line. This command is executed asynchronously, so the return value is
  # ignored.
  plug.command(:SetLine, nargs: 1) do |nvim, str|
    nvim.current.line = str
  end

  plug.command(:SetColorscheme) do |nvim| 
    nvim.command("colorscheme tokyonight")
  end

  # Define a function called "Sum" which adds two numbers. This function is
  # executed synchronously, so the result of the block will be returned to nvim.
  plug.function(:Sum, nargs: 2, sync: true) do |nvim, x, y|
    x + y
  end

  # Define an autocmd for the BufEnter event on Ruby files.
  plug.autocmd(:BufEnter, pattern: "*.rb") do |nvim|
    nvim.command("echom 'Ruby file, eh?'")
  end
end
