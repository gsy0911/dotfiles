return {
  "frankroeder/parrot.nvim",
  dependencies = { 'ibhagwan/fzf-lua', 'nvim-lua/plenary.nvim' },
  -- optionally include "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup({
      -- Providers must be explicitly added to make them available.
      providers = {
        -- anthropic = {
        --   api_key = os.getenv "ANTHROPIC_API_KEY",
        -- },
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
    })
  end,
  keys = {
    {mode = "n", "<C-g>t", "<cmd>PrtChatNew tabnew<CR>", desc = "new chat with tab"},
    {mode = "n", "<C-g>v", "<cmd>PrtChatNew vsplit<CR>", desc = "new chat with vsplit"},
  },
}
