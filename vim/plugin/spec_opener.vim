function! FindWith(split_file_path, project_name, spec_dir)
  let l:project_index=index(a:split_file_path, a:project_name)
  call remove(a:split_file_path, l:project_index+1)

  " Inject the spec dir
  call insert(a:split_file_path, a:spec_dir, l:project_index+1)

  let l:file_name = a:split_file_path[len(a:split_file_path)-1]

  let l:spec_file_name = strpart(l:file_name, 0, strlen(l:file_name)-3)."_spec.rb"

  "replace the file name with the spec file name
  let a:split_file_path[len(a:split_file_path)-1] = l:spec_file_name

  let l:spec_file_path = join(a:split_file_path, "/")

  return "/".l:spec_file_path
endfunction

function! FindSpec()
  let l:cwd=getcwd()
  let l:split_cwd=split(l:cwd, "/")
  let l:project_name=l:split_cwd[len(l:split_cwd)-1]
  let l:file_path=expand("%:p")
  let l:split_file_path=split(l:file_path, "/")

  let l:project_index = index(l:split_file_path, project_name)

  if l:project_index == -1
       echo "No spec or spec_no_rails dir was found"
       return
  endif

  let l:spec_file_path = FindWith(split(l:file_path, "/"), l:project_name, "spec")
  "echo l:spec_file_path
  if filereadable(l:spec_file_path)
    execute ":vsplit ".l:spec_file_path
    return
  endif

  let l:spec_no_rails_file_path = FindWith(split(l:file_path, "/"), l:project_name, "spec_no_rails")
  "echo l:spec_file_path
  if filereadable(l:spec_no_rails_file_path)
    execute ":vsplit ".l:spec_no_rails_file_path
    return
  endif

  " This will create the file in the buffer,
  " but won't work properly when I am working on a gem
  " I still need to check if it's a Rails project
  if index(l:split_file_path, "lib") == -1
    execute ":vsplit ".l:spec_file_path
    return
  else
    execute ":vsplit ".l:spec_no_rails_file_path
    return
  endif

  echo "Sorry, I don't know what to do"
endfunction

nmap ,a :call FindSpec()<CR>
