syntax sync fromstart
syn match VimChatTime /\[\d\d\d\d-\d\d-\d\d\s\d\d\:\d\d]/
syn match VimChatVert /│/
syn match VimChatNick /\[\d\d\d\d-\d\d-\d\d\s\d\d\:\d\d]\s│[^│]*│/ contains=VimChatTime,VimChatVert

syntax match VimRssIcon /\(▼\|▶\)/
syntax match VimChatRemoteNickL /\*\*`/ conceal
syntax match VimChatRemoteNickR /`\*\*/ conceal
syntax match VimChatRemoteNick /**`[^`]*`\*\*/ contains=VimChatRemoteNickR,VimChatRemoteNickL
syntax match VimChatPing /\s\zs@\S*/
syntax match VimChatQuoteMsg /.*│\s>\s.*/ contains=VimChatTime,VimChatVert,VimChatNick
syn region VimChatCodeBlockLines start=".*│\s*````*.*$" end="│\s*````*\ze\s*$" contains=VimChatTime,VimChatVert,VimChatNick keepend
syntax match VimChatReplayCounts /.*│\s->\s\d*\s\(reply\|replies\)/ contains=VimChatTime,VimChatVert,VimChatNick
" hi def link vimChatMsg	Comment
hi def link VimRssIcon Todo
hi def link VimChatQuoteMsg Comment
hi def link VimChatReplayCounts Comment
hi def link VimChatNick Type
hi def link VimChatVert VertSplit
hi def link VimChatRemoteNick Todo
hi def link VimChatPing ModeMsg
hi def link VimChatCodeBlock String
hi def link VimChatCodeBlockLines String
