if exists('b:current_syntax')
    finish
endif
syn match	qfFileName	"^[^│]*" contains=qfLineNr
syn match	qfSeparator	"│"
syn match	qfLineNr	":\d*" contained

" The default highlighting.
hi def link qfFileName	Directory
hi def link qfLineNr	LineNr
hi def link qfSeparator	VertSplit

let b:current_syntax = 'qf'
