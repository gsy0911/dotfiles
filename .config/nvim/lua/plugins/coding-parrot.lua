return {
  "frankroeder/parrot.nvim",
  dependencies = { 
    -- 'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim'
  },
  lazy = false,
  enabled = false,
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    -- require("fzf-lua").setup({})
    require("parrot").setup({
      -- Providers must be explicitly added to make them available.
      providers = {
        -- models: https://docs.anthropic.com/en/docs/about-claude/models
        anthropic = {
          api_key = os.getenv "ANTHROPIC_API_KEY",
          topic = {
            model = "claude-3-haiku-20240307"
          }
        },
        -- gemini = {
        --   api_key = os.getenv "GEMINI_API_KEY",
        -- },
        -- groq = {
        --   api_key = os.getenv "GROQ_API_KEY",
        -- },
        -- mistral = {
        --   api_key = os.getenv "MISTRAL_API_KEY",
        -- },
        -- see: https://docs.perplexity.ai/guides/model-cards
        pplx = {
          api_key = os.getenv "PERPLEXITY_API_KEY",
          topic = {
            model = "llama-3.1-sonar-large-128k-chat"
          },
        },
        -- provide an empty list to make provider available (no API key required)
        -- ollama = {},
        openai = {
          api_key = os.getenv "OPENAI_API_KEY",
          topic = {
            model = "gpt-4o"
          }
        },
        -- github = {
        --   api_key = os.getenv "GITHUB_TOKEN",
        -- },
        -- nvidia = {
        --   api_key = os.getenv "NVIDIA_API_KEY",
        -- },
        -- xai = {
        --   api_key = os.getenv "XAI_API_KEY",
        -- },
      },    
      system_prompt = {
        chat = "openai",
        command = "anthropic"
      },
    })
  end,
  keys = {
    {mode = "n", "<C-g>t", "<cmd>PrtChatToggle popup<CR>", desc = "new chat with popup"},
    {mode = "n", "<C-g>c", "<cmd>PrtChatNew popup<CR>", desc = "new chat with popup"},
    {mode = "n", "<C-g>pp", "<cmd>PrtProvider pplx<CR>", desc = "new chat with Perplexity"},
    {mode = "n", "<C-g>po", "<cmd>PrtProvider openai<CR>", desc = "new chat with OpenAI"},
    {mode = "n", "<C-g>pa", "<cmd>PrtProvider anthropic<CR>", desc = "new chat with Anthropic"},
    {mode = "v", "<C-g>r", ":'<,'>PrtRewrite<CR>", desc = "rewrite code with comment"},
    {mode = "v", "<C-g>i", ":'<,'>PrtImplement<CR>", desc = "implement code from selected comment"},
    {mode = "v", "<C-g>a", ":'<,'>PrtAppend<CR>", desc = "add comment"},
    {mode = "n", "<C-g>s", "<cmd>PrtStatus<CR>", desc = "show model"},
  },
}

