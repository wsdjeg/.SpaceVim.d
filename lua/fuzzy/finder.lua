local finder = {}

function finder.find(p)
  return vim.split(vim.system({'rg', '--files'}, {text = true, cwd = p}):wait().stdout, "\n", {trimempty = true})
end

return finder
