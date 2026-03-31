return {
    'uZer/pywal16.nvim',
    config = function()
        local pywal = require("pywal16")

        pywal.setup({
           transparent = true
        })
        
        vim.cmd.colorscheme("pywal16")
    end
}
