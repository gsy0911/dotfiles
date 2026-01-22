return {
    "kaarmu/typst.vim",
    ft = "typst",
    event =  "VeryLazy",
    config = function() vim.g.typst_pdf_viewer = "skim" end, -- ここは好きなpdf viewerを入れるとよい
}
