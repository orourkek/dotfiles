let g:airline#themes#base16_ocean_light#palette = {}

let s:guibg = '#080808'
let s:guibg2 = '#1c1c1c'
let s:termbg = 6
let s:termbg2= 7

let s:abg = 2
let s:afg = 7
let s:bbg = 4
let s:bfg = 2
let s:cbg = 7
let s:cfg = 3

let s:N1 = [ s:guibg , '#00dfff' , s:afg, s:abg ]
let s:N2 = [ '#ff5f00' , s:guibg2, s:bfg, s:bbg ]
let s:N3 = [ '#767676' , s:guibg, s:cfg, s:cbg ]
let g:airline#themes#base16_ocean_light#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#base16_ocean_light#palette.normal_modified = {
      \ 'airline_c': [ '#df0000' , s:guibg, 15, 11, '' ],
      \ }


let s:I1 = [ s:guibg, '#5fff00' , 15, 12 ]
let s:I2 = [ '#ff5f00' , s:guibg2, s:afg, s:abg ]
let s:I3 = [ '#767676' , s:guibg, s:bfg, s:bbg ]
let g:airline#themes#base16_ocean_light#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#base16_ocean_light#palette.insert_modified = copy(g:airline#themes#base16_ocean_light#palette.normal_modified)
let g:airline#themes#base16_ocean_light#palette.insert_paste = {
      \ 'airline_a': [ s:I1[0]   , '#d78700' , s:I1[2] , 172     , ''     ] ,
      \ }


let g:airline#themes#base16_ocean_light#palette.replace = {
      \ 'airline_a': [ s:I1[0]   , '#af0000' , s:I1[2] , 124     , ''     ] ,
      \ }
let g:airline#themes#base16_ocean_light#palette.replace_modified = copy(g:airline#themes#base16_ocean_light#palette.normal_modified)


let s:V1 = [ s:guibg, '#dfdf00' , 15, 9 ]
let s:V2 = [ '#ff5f00' , s:guibg2, s:afg, s:abg ]
let s:V3 = [ '#767676' , s:guibg, s:bfg, s:bbg ]
let g:airline#themes#base16_ocean_light#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
let g:airline#themes#base16_ocean_light#palette.visual_modified = copy(g:airline#themes#base16_ocean_light#palette.normal_modified)


let s:IA  = [ '#4e4e4e' , s:guibg  , 239 , s:termbg  , '' ]
let s:IA2 = [ '#4e4e4e' , s:guibg2 , 239 , s:termbg2 , '' ]
let g:airline#themes#base16_ocean_light#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA2, s:IA2)
let g:airline#themes#base16_ocean_light#palette.inactive_modified = {
      \ 'airline_c': [ '#df0000', '', 160, '', '' ] ,
      \ }

