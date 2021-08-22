(module plugins.lualine)

(let [lualine (require :lualine)]
  (when lualine
    (lualine.setup
      {:options {:theme "vscode"}})))
