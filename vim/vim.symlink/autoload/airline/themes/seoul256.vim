let g:airline#themes#seoul256#palette = {}

" Color palette
let s:cterm_termbg    = 239  " Background for branch and file format blocks
let s:gui_termbg      = '#5F5F5F'
let s:cterm_termfg    = 187  " Foreground for branch and file format blocks
let s:gui_termfg      = '#AFAF87'

let s:cterm_termbg2   = 236  " Background for middle block
let s:gui_termbg2     = '#1C1C1C'
let s:cterm_termfg2   = 250   " Foreground for middle block
let s:gui_termfg2     = '#F5F5F5'

let s:cterm_normalbg  = 101   " Background for normal mode and file position blocks
let s:gui_normalbg    = '#5F87FF'
let s:cterm_normalfg  = 234   " Foreground for normal mode and file position blocks
let s:gui_normalfg    = '#FFFFFF'

let s:cterm_insertbg  = 220   " Background for insert mode and file position blocks
let s:gui_insertbg    = '#87AF5F'
let s:cterm_insertfg  = 234   " Foreground for insert mode and file position blocks
let s:gui_insertfg    = '#FFFFFF'

let s:cterm_visualbg  = 173  " Background for visual mode and file position blocks
let s:gui_visualbg    = '#ff8c00'
let s:cterm_visualfg  = 234   " Foreground for visual mode and file position blocks
let s:gui_visualfg    = '#FFFFFF'

let s:cterm_replacebg = 52   " Background for replace mode and file position blocks
let s:gui_replacebg   = '#870000'
let s:cterm_replacefg = 255   " Foreground for replace mode and file position blocks
let s:gui_replacefg   = '#FFFFFF'

let s:cterm_alert     = 173   " Modified file alert color
let s:gui_alert       = '#870000'

let s:cterm_inactivebg = 236 " Background for inactive mode
let s:gui_inactivebg   = '#1C1C1C'
let s:cterm_inactivefg = 250 " Foreground for inactive mode
let s:gui_inactivefg   = '#4E4E4E'

" Branch and file format
let s:BB = [s:gui_termfg, s:gui_termbg, s:cterm_termfg, s:cterm_termbg] " Branch and file format blocks

" Normal mode
let s:N1 = [s:gui_normalfg, s:gui_normalbg, s:cterm_normalfg, s:cterm_normalbg] " Outside blocks in normal mode
let s:N2 = [s:gui_termfg2, s:gui_termbg2, s:cterm_termfg2, s:cterm_termbg2]     " Middle block
let g:airline#themes#seoul256#palette.normal = airline#themes#generate_color_map(s:N1, s:BB, s:N2)
let g:airline#themes#seoul256#palette.normal_modified = {'airline_c': [s:gui_alert, s:gui_termbg2, s:cterm_alert, s:cterm_termbg2, ''] ,}

" Insert mode
let s:I1 = [s:gui_insertfg, s:gui_insertbg, s:cterm_insertfg, s:cterm_insertbg] " Outside blocks in insert mode
let s:I2 = [s:gui_insertbg, s:gui_termbg2, s:cterm_insertbg, s:cterm_termbg2]   " Middle block
let g:airline#themes#seoul256#palette.insert = airline#themes#generate_color_map(s:I1, s:BB, s:I2)
let g:airline#themes#seoul256#palette.insert_modified = {'airline_c': [s:gui_alert, s:gui_termbg2, s:cterm_alert, s:cterm_termbg2, ''] ,}

" Replace mode
let s:R1 = [s:gui_replacefg, s:gui_replacebg, s:cterm_replacefg, s:cterm_replacebg]  " Outside blocks in replace mode
let s:R2 = [s:gui_termfg, s:gui_termbg2, s:cterm_replacefg, s:cterm_replacebg]            " Middle block
let g:airline#themes#seoul256#palette.replace = airline#themes#generate_color_map(s:R1, s:BB, s:R2)
let g:airline#themes#seoul256#palette.replace_modified = {'airline_c': [s:gui_alert, s:gui_termbg2, s:cterm_alert, s:cterm_termbg2, ''] ,}

" Visual mode
let s:V1 = [s:gui_visualfg, s:gui_visualbg, s:cterm_visualfg, s:cterm_visualbg] " Outside blocks in visual mode
let s:V2 = [s:gui_visualbg, s:gui_termbg2, s:cterm_visualbg, s:cterm_termbg2]   " Middle block
let g:airline#themes#seoul256#palette.visual = airline#themes#generate_color_map(s:V1, s:BB, s:V2)
let g:airline#themes#seoul256#palette.visual_modified = {'airline_c': [s:gui_alert, s:gui_termbg2, s:cterm_alert, s:cterm_termbg2, ''] ,}

" Inactive mode
let s:IA1 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA2 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let s:IA3 = [s:gui_inactivefg, s:gui_inactivebg, s:cterm_inactivefg, s:cterm_inactivebg, '']
let g:airline#themes#seoul256#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

" Tabline colors
 let g:airline#themes#seoul256#palette.tabline = {
        \ 'airline_tab':    s:BB,
        \ 'airline_tabsel': s:V1,
        \ 'airline_tabtype': s:V1,
        \ 'airline_tabfill': s:N2,
        \ 'airline_tabhid': s:N2,
        \ 'airline_tabmod': s:I1,
        \ 'airline_tabmod_unsel': s:I2
        \ }
