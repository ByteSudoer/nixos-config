require("bufferline").setup({
    options = {
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      mode = "tabs",
      separator_style = "thin",
      always_show_bufferline = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
  
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
  
      color_icons = true,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  })