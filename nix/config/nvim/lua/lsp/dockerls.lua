return {
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({'Dockerfile', '.git'}, { path = fname, upward = true })[1])
  end,
}
