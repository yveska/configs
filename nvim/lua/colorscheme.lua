vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if not normal.bg then return end
    io.write(string.format("\027Ptmux;\027\027]11;#%06x\007\027\\", normal.bg))
    io.write(string.format("\027]11;#%06x\027\\", normal.bg))
  end,
})

vim.api.nvim_create_autocmd("UILeave", {
  callback = function()
    io.write("\027Ptmux;\027\027]111;\007\027\\")
    io.write("\027]111\027\\")
  end,
})

local lackluster = require("lackluster")
local color = lackluster.color

lackluster.setup({
    tweak_color = {
        red   = color.luster, 
        green = "#8c9ca2", 
        blue  = "#8c9ca2",
    },
    tweak_syntax = {
        keyword = color.luster,
        type    = color.luster,
        string  = "#c2cfd4",
        comment = "#767d82",
    },
})

vim.cmd.colorscheme("lackluster")

-- UI Highlighting
local hl = vim.api.nvim_set_hl
hl(0, 'Normal', { fg = '#d1d8db' })
hl(0, 'Directory', { fg = '#b5c1c6', bold = true })

-- mini.pick configuration
local pick_hl = vim.api.nvim_set_hl
pick_hl(0, 'MiniPickMatchText', { fg = color.luster, bold = true })
pick_hl(0, 'MiniPickMatchCurrent', { fg = '#DEEEED', bg = '#1c1e20' })
pick_hl(0, 'MiniPickPrompt', { fg = color.luster, bg = '#141617', bold = true })
