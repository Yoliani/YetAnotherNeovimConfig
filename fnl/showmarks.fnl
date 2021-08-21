(fn get-marks []
  (let [marks (vim.fn.getmarklist "%" )
        ns  0
        buf 0]
   (each [_ {:mark mark :pos [_ line _ _]} (ipairs marks)]
     (vim.api.nvim_buf_set_virtual_text buf ns line [mark WarningMsg] {}))))

(get-marks)

