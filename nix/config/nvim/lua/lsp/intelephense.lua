return {
  root_dir = function(fname)
    return vim.fs.dirname(vim.fs.find({'composer.json', '.git'}, { path = fname, upward = true })[1])
  end,
  settings = {
    intelephense = {
      composer = {
        enabled = true,
      },
      phpdoc = {
        useFullyQualifiedNames = true,
      },
      files = {
        maxSize = 5000000,
        associations = { "*.php", "*.phtml" },
        exclude = {
          "**/.git/**",
          "**/.svn/**",
          "**/.hg/**",
          "**/CVS/**",
          "**/.DS_Store/**",
          "**/node_modules/**",
          "**/bower_components/**",
          "**/var/cache/**",
        },
      },
      completion = {
        insertUseDeclaration = true,
        fullyQualifyGlobalConstantsAndFunctions = false,
      },
    },
  },
}
