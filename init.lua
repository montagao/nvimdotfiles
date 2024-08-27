require("monta")

-- Function to copy the current file path and line number
_G.copy_file_path_and_line_number = function()
  local file_path = vim.fn.expand('%:p')
  local line_number = vim.fn.line('.')
  local copy_text = file_path .. ":" .. line_number

  -- Copy to system clipboard
  vim.fn.setreg('+', copy_text)
  print("Copied: " .. copy_text)
end


