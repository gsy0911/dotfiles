return {
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({'.venv', 'pyproject.toml', 'setup.py', '.git'}, { path = fname, upward = true })[1])
  end,
  settings = {
    python = {
      venvPath = ".",
      pythonPath = "./.venv/bin/python",
    },
  },
}
