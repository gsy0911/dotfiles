return {
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({'docker-compose.yml', 'docker-compose.yaml', 'compose.yml', 'compose.yaml', '.git'}, { path = fname, upward = true })[1])
  end,
}
