return {
  "rest-nvim/rest.nvim",
  dependencies = { { "nvim-lua/plenary.nvim" } },
  config = function()
    local rest_nvim = require("rest-nvim")

    rest_nvim.setup({
      result_split_horizontal = false,
      result_split_in_place = false,
      stay_in_current_window_after_split = false,
      skip_ssl_verification = true,
      encode_url = true,
      hightlight = {
        enabled = true,
        timeout = 150,
      },
      result = {
        show_url = true,
        show_curl_command = true,
        show_http_info = true,
        show_headers = true,
        show_statistics = false,
        formatters = {
          json = "jq",
          html = function(body)
            return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
          end,
        },
      },
      jump_to_request = false,
      env_file = ".env",
      custom_dynamic_variables = {},
      yank_dry_run = true,
      search_back = true,
    })

    vim.keymap.set({"n"}, "<leader>h", function() rest_nvim.run() end)
  end
}
