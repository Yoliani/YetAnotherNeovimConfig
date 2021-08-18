(fn get-marks []
  (let [marks (vim.fn.getmarklist "%" )
        ns  0
        buf 0]
   (print (vim.inspect marks))))

(get-marks)
