command! VimGameSnake :call s:main()

let g:VimSnakeScore = 0

let s:config = {
            \ 'width': 0,
            \ 'height': 0,
            \ 'border': 1,
            \ 'innerWidth': 0,
            \ 'innerHeight': 0,
            \ 'limitTop': 0,
            \ 'limitBottom': 0,
            \ 'limitLeft': 0,
            \ 'limitRight': 0,
            \ }

let s:seed = localtime()

let s:item = {
            \ 'wall': 'W',
            \ 'body': 'B',
            \ 'food': 'F',
            \ 'empty': ' ',
            \ }

let s:snake = [ { 'x' : 1 , 'y' : 1 } ]
let s:direction = { 'x': 1, 'y': 0 }

let s:move = {
            \ 'left'  : { 'x' : -1 , 'y' : 0 },
            \ 'down'  : { 'x' : 0  , 'y' : 1 },
            \ 'up'    : { 'x' : 0  , 'y' : -1 },
            \ 'right' : { 'x' : 1  , 'y' : 0 },
            \ }

function! s:main()

    call s:init()
    let l:food = s:newFood()

    let l:loop = 1
    while l:loop == 1

        let l:input = nr2char(getchar(0))

        call s:updateDirection(l:input)
        let l:food = s:updateSnake(l:food)

        let l:isGameOver = s:checkGameOver(s:snake)

        if l:input == 'c' || l:isGameOver == 1
            break
        endif

        call s:moveSnake(l:food)

        if l:input == 'q'
            let l:loop = 0
            bdelete!
        endif

        sleep 100ms
        redraw

    endwhile

endfunction

function! s:checkGameOver(snake)
    let l:head = a:snake[0]

    if s:isWall(l:head['x'], l:head['y'])
                \ || s:isSnakeBody(l:head['x'], l:head['y'])
        return 1
    endif

    return 0
endfunction

function! s:isWall(x, y)
    return s:getCharValue(a:x, a:y) == s:item['wall']
endfunction

function! s:isSnakeBody(x, y)
    return s:getCharValue(a:x, a:y) == s:item['body']
endfunction


" Game initialize
function! s:init()

    call s:createBuffer()
    call s:setLocalSetting()
    call s:setConfig()
    call s:setColor()
    call s:drawScreen(s:config, s:item)
    call s:setSnake(s:config['width']/2, s:config['height']/2)

endfunction

function! s:newFood()
    let l:randomX = s:rand(s:config['innerWidth']) + s:config['border']
    let l:randomY = s:rand(s:config['innerHeight']) + s:config['border'] + 1
	let g:VimSnakeScore += 1

    for body in s:snake
        if body['x'] == l:randomX && body['y'] == l:randomY
            let l:f = s:snake[-1]
            let l:randomX = l:f['x']
            let l:randomY = l:f['y']
            break
        endif
    endfor

    call s:drawChar(l:randomX, l:randomY, 'F')
    return { 'x': l:randomX, 'y': l:randomY }
endfunction

function! s:rand(div)
    let s:num = system('echo $RANDOM')[0:-2]
    return s:num % a:div
endfunction

function! s:updateDirection(input)
    if a:input == 'h'
        if s:direction != s:move['right']
            let s:direction = s:move['left']
        endif
    elseif a:input == 'j'
        if s:direction != s:move['up']
            let s:direction = s:move['down']
        endif
    elseif a:input == 'k'
        if s:direction != s:move['down']
            let s:direction = s:move['up']
        endif
    elseif a:input == 'l'
        if s:direction != s:move['left']
            let s:direction = s:move['right']
        endif
    endif
endfunction

function! s:moveSnake(food)
    let l:head = s:snake[0]
    let l:tail = s:snake[-1]
    call s:drawChar(l:head['x'], l:head['y'], s:item['body'])
    call s:drawChar(l:tail['x'], l:tail['y'], s:item['empty'])
    call s:drawChar(a:food['x'], a:food['y'], s:item['food'])
endfunction

function! s:drawChar(x, y, char)
    execute "normal! " . a:y . 'gg0' . a:x . 'lr' . a:char . 'gg0'
endfunction

function! s:updateSnake(food)
    let l:dx = s:direction['x']
    let l:dy = s:direction['y']
    let l:head = s:snake[0]
    let l:newHead = { 'x': l:head['x'] + l:dx, 'y': l:head['y'] + l:dy }
    let s:snake = [ l:newHead ] + s:snake[0:-2]

    if l:newHead['x'] == a:food['x'] && l:newHead['y'] == a:food['y']
        let s:snake = s:snake + [s:snake[-1]]
        return s:newFood()
    endif

    return a:food
endfunction

function! s:setSnake(x, y)
    let s:snake = [ { 'x': a:x, 'y': a:y }, { 'x': a:x, 'y': a:y } ]
    let s:snake = s:snake + s:snake + s:snake
endfunction

function! s:createBuffer()
    silent edit `='VIM-GAME-SNAKE'`
endfunction

function! s:setLocalSetting()
    setlocal bufhidden=wipe
    setlocal buftype=nofile
    setlocal buftype=nowrite
    setlocal nocursorcolumn
    setlocal nocursorline
    setlocal nolist
    setlocal nonumber
    setlocal noswapfile
    setlocal nowrap
    setlocal nonumber
    setlocal norelativenumber
endfunction

function! s:setConfig()
    let l:width = winwidth(0)
    let l:height = winheight(0)
    let l:border = s:config['border']
    let s:config['width'] = l:width
    let s:config['height'] = l:height
    let s:config['innerWidth'] = l:width - (l:border * 2)
    let s:config['innerHeight'] = l:height - (l:border * 2)
    let s:config['limitTop'] = l:border
    let s:config['limitBottom'] = l:height - l:border
    let s:config['limitLeft'] = l:border
    let s:config['limitRight'] = l:width - l:border
endfunction

function! s:drawScreen(config, item)
    let l:width = a:config['width']
    let l:height = a:config['height']
    let l:wall = a:item['wall']

    let l:border = a:config['border']
    let l:innerHeight = a:config['innerHeight']
    let l:innerWidth = a:config['innerWidth']

    " Draw full screen
    let lines = repeat([repeat(l:wall, l:width)], l:height)

    " draw game board
    for row in range(1,l:innerHeight)
        let lines[row] = repeat(l:wall, l:border)
                    \ .repeat(' ', l:innerWidth)
                    \ .repeat(l:wall, l:border)
    endfor

    " Draw on buffer
    call setline(1, lines)
    redraw
endfunction

function! s:setColor()
    syntax match wall 'W'
    syntax match snakeHEAD 'H'
    syntax match snakeBody 'B'
    syntax match snakeFood 'F'
    highlight wall ctermfg=blue ctermbg=blue guifg=blue guibg=blue
    highlight snakeBody ctermfg=green ctermbg=green guifg=green guibg=green
    highlight snakeFood ctermfg=red ctermbg=red guifg=red guibg=red
endfunction

function! s:getCharValue(x, y)
    return getline(a:y)[a:x]
endfunction

