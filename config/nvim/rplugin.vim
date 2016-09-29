" python3 plugins
call remote#host#RegisterPlugin('python3', 'C:/Users/wsdjeg/.cache/vimfiles/repos/github.com/Shougo/deoplete.nvim/rplugin/python3/deoplete', [
      \ {'sync': v:true, 'name': '_deoplete', 'opts': {}, 'type': 'function'},
     \ ])


" ruby plugins


" python plugins
call remote#host#RegisterPlugin('python', 'C:/Users/wsdjeg/.cache/vimfiles/repos/github.com/floobits/floobits-neovim/rplugin/python/floobits', [
      \ {'sync': v:false, 'name': 'FlooAddBuf', 'type': 'command', 'opts': {'complete': 'file', 'nargs': 1}},
      \ {'sync': v:false, 'name': 'BufEnter', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:true, 'name': 'BufReadPost', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:true, 'name': 'BufWinEnter', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:true, 'name': 'FlooJoinWorkspace', 'type': 'command', 'opts': {'nargs': 1}},
      \ {'sync': v:false, 'name': 'FlooClearHighlights', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'FlooCompleteSignup', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'CursorMoved', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:false, 'name': 'CursorMovedI', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:false, 'name': 'FlooDeleteBuf', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'FileChangedShellPost', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:false, 'name': 'FlooToggleFollowMode', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'FlooFollowUser', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'FlooInfo', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'InsertEnter', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:true, 'name': 'FlooListMessages', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'BufWritePost', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:false, 'name': 'FlooOpenInBrowser', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'FlooLeaveWorkspace', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'QuickFixCmdPost', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:true, 'name': 'FlooSaySomething', 'type': 'command', 'opts': {}},
      \ {'sync': v:true, 'name': 'FlooShareDirPrivate', 'type': 'command', 'opts': {'complete': 'dir', 'nargs': 1}},
      \ {'sync': v:true, 'name': 'FlooShareDirPublic', 'type': 'command', 'opts': {'complete': 'dir', 'nargs': 1}},
      \ {'sync': v:false, 'name': 'FlooSummon', 'type': 'command', 'opts': {}},
      \ {'sync': v:false, 'name': 'TextChanged', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:false, 'name': 'TextChangedI', 'type': 'autocmd', 'opts': {'pattern': '*'}},
      \ {'sync': v:false, 'name': 'FlooToggleHighlights', 'type': 'command', 'opts': {}},
      \ {'sync': v:true, 'name': 'FlooUsersInWorkspace', 'type': 'command', 'opts': {}},
     \ ])


