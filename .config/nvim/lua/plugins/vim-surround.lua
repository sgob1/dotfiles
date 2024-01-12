return {
    "tpope/vim-surround",
    lazy = false,
    config = function()
        vim.cmd[[
            " Surround custom mapping for Colemak
            let g:surround_no_mappings = 1
            nmap dms  <Plug>Dsurround
            nmap cms  <Plug>Csurround
            nmap cmS  <Plug>CSurround
            nmap mys  <Plug>Ysurround
            nmap myS  <Plug>YSurround
            nmap myss <Plug>Yssurround
            nmap mySs <Plug>YSsurround
            nmap mySS <Plug>YSsurround
            xmap mS   <Plug>VSurround
            xmap mgS  <Plug>VgSurround
            if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
                if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
                    imap    <C-S> <Plug>Isurround
                endif
                imap      <C-G>s <Plug>Isurround
                imap      <C-G>S <Plug>ISurround
            endif
        ]]
    end
}
