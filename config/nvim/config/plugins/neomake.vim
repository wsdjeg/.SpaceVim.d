let g:neomake_open_list = 2  " 1 open list and move cursor 2 open list without move cursor
let g:neomake_verbose = 0
let g:neomake_error_sign = {
            \ 'text': get(g:settings, 'error_symbol', '✖'),
            \ 'texthl': 'GruvboxRedSign',
            \ }
let g:neomake_warning_sign = {
            \ 'text': get(g:settings, 'warning_symbol', '➤'),
            \ 'texthl': 'GruvboxYellowSign',
            \ }
