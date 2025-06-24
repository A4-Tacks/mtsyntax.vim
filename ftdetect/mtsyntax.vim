" vint: -ProhibitAutocmdWithNoGroup

autocmd BufRead,BufNewFile *.mtsx if &ft !=# 'mtsyntax' | setf mtsyntax | en
