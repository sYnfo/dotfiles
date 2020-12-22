if !exists('g:test#go#bazel#file_pattern')
  let g:test#go#bazel#file_pattern = '\v[^_].*_test\.go$'
endif

" Returns true if the given file belongs to your test runner
function! test#go#bazel#test_file(file) abort
  return test#go#test_file('gotest', g:test#go#bazel#file_pattern, a:file)
endfunction

function! s:nearest_test(position) abort
  let name = test#base#nearest_test(a:position, g:test#go#patterns)
  return join(name['test'])
endfunction

" Returns test runner's arguments which will run the current file and/or line
function! test#go#bazel#build_position(type, position)
  let filepath = a:position['file']
  let filedir = fnamemodify(a:position['file'], ':h')
  let filename = fnamemodify(a:position['file'], ':t:r')
  let parentdir = fnamemodify(filedir, ':t')
  if a:type ==# 'nearest'
    let name = s:nearest_test(a:position)
    if !empty(name)
      return ['--test_filter=' . "'" . name . "$'" . ' -- //' . filedir . ':go_default_test']
    endif
  endif
  return [' -- //' . filedir . ':' . parentdir . '_auto_gen_' . filename]
endfunction

" Returns processed args (if you need to do any processing)
function! test#go#bazel#build_args(args) abort
  return a:args
endfunction

" Returns the executable of your test runner
function! test#go#bazel#executable()
  return '$HOME/stripe/gocode/bazel test'
  "return 'echo'
endfunction
