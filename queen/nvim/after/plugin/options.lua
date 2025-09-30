vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.listchars = {
  eol = "󰌑",
  space = "·",
  trail = "·",
}

vim.g.python_recommended_style = 0

vim.fn.matchadd("errorMsg", [[\s\+$]])

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "restore from last session when running with 0 arguments",
  callback = function()
    if vim.fn.argc() == 0 then
      vim.schedule(function()
        require("persistence").load({ last = true })
      end)
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "open Neotree when nvim starts",
  callback = function()
    vim.cmd("Neotree show")
  end,
})
