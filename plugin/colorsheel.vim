const s:pi2 = 2 * 3.14159265
" pixel_ratio means the ratio of the character size.
const s:pixel_ratio = 2.0 / 1.0

" ColorWheel draws a color wheel
function! ColorWheel() abort
  const [center_x, center_y] = [&columns / 2.0, &lines / 2.0]
  const radius = min([&columns, &lines]) / 8.0 * 3
  " loop over the distance multiplied by pixel_ratio in the horizontal
  " direction because the character has a rectangular shape.
  let col = center_x - radius * s:pixel_ratio
  while col < center_x + radius * s:pixel_ratio
    let row = center_y - radius
    while row < center_y + radius
      " calculate the coordinate mathematically
      let [x, y] = [(col - center_x) / s:pixel_ratio, center_y - row]
      " distance from the center max to 1.0
      let r = sqrt(x * x + y * y) / radius
      if r <= 1.0
        let [i_col, i_row] = [float2nr(col), float2nr(row)]
        " open a float window with 1x1 size
        let winid = nvim_open_win(bufnr(''), v:false, {
              \ 'relative': 'win',
              \ 'width': 1, 'height': 1,
              \ 'col': i_col, 'row': i_row,
              \ })
        let hl_name = 'CircleBG' . i_col . i_row
        execute 'hi' hl_name 'guibg=' . PositionToRGB(x, y, r)
        call nvim_win_set_option(winid, 'winhighlight', 'Normal:' . hl_name)
      endif
      let row += 1
    endwhile
    let col += 1
  endwhile
endfunction

" PositionToRGB converts the coordinate into the color in RGB representation.
function! PositionToRGB(x, y, r) abort
  const theta = atan2(a:y, a:x)
  const angle = theta >= 0 ? theta : theta + s:pi2
  " TODO: enable to change v
  const [h, s, v] = [angle / s:pi2, a:r, 1.0]

  " Convert HSV to RGB
  if v == 0
    let rgb = [0, 0, 0]
  elseif s == 0
    let rgb = [v, v, v]
  else
    const chroma = s * v
    const min_v = v - chroma
    if h >= 2.0 / 3
      const temp = (h - 2.0 / 3) * 6
      let rgb = temp < 1 ? [v * temp, 0, v] : [v, 0, v * (2 - temp)]
    elseif h >= 1.0 / 3
      const temp = (h - 1.0 / 3) * 6
      let rgb = temp < 1 ? [0, v, v * temp] : [0, v * (2 - temp), v]
    else
      const temp = h * 6
      let rgb = temp < 1 ? [v, v * temp, 0] : [v * (2 - temp), v, 0]
    endif
    for i in [0, 1, 2]
      let rgb[i] = rgb[i] / v * (v - min_v) + min_v
    endfor
  endif

  let color = '#'
  for c in rgb
    let color .= printf('%02x', float2nr(c * 255))
  endfor
  return color
endfunction
