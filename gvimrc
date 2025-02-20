" vim: foldmethod=marker
" vim: foldcolumn=3

" Basic GUI Options {{{1
set guioptions=a
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
"set guifont=Bitstream\ Vera\ Sans\ Mono\ 8

"set macligatures
"set guifont=Fira\ Code:h14
"set guifont=Fira\ Code:h10
"set guifont=IBM\ Plex\ Mono\ 10
"set guifont=BlexMono\ Nerd\ Font\ Medium\ 10
set guifont=BlexMono\ Nerd\ Font\ Medium\ 12
"set guifont=BlexMono\ Nerd\ Font\ Medium:h12


" List Chars {{{1
set listchars=tab:\ \|,trail:␣

" Colour Scheme {{{1
"set background=light
set background=dark
let g:gruvbox_contrast_dark="hard"
"let g:gruvbox_contrast_dark="medium"
let g:gruvbox_contrast_light="hard"
"let g:gruvbox_contrast_light="medium"
"colorscheme solarized
"colorscheme srcery
colorscheme gruvbox

" Vim Terminal Colors {{{1
"set background=light
"if exists('*term_setansicolors')
"  let g:terminal_ansi_colors = repeat([0], 16)
"
"  let g:terminal_ansi_colors[0] = s:bg0[0]
"  let g:terminal_ansi_colors[8] = s:gray[0]
"
"  let g:terminal_ansi_colors[1] = s:gb.neutral_red[0]
"  let g:terminal_ansi_colors[9] = s:red[0]
"
"  let g:terminal_ansi_colors[2] = s:gb.neutral_green[0]
"  let g:terminal_ansi_colors[10] = s:green[0]
"
"  let g:terminal_ansi_colors[3] = s:gb.neutral_yellow[0]
"  let g:terminal_ansi_colors[11] = s:yellow[0]
"
"  let g:terminal_ansi_colors[4] = s:gb.neutral_blue[0]
"  let g:terminal_ansi_colors[12] = s:blue[0]
"
"  let g:terminal_ansi_colors[5] = s:gb.neutral_purple[0]
"  let g:terminal_ansi_colors[13] = s:purple[0]
"
"  let g:terminal_ansi_colors[6] = s:gb.neutral_aqua[0]
"  let g:terminal_ansi_colors[14] = s:aqua[0]
"
"  let g:terminal_ansi_colors[7] = s:fg4[0]
"  let g:terminal_ansi_colors[15] = s:fg1[0]
"endif
