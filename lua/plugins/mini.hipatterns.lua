return {
    "echasnovski/mini.hipatterns",
    opts = function()
        local hipatterns = require "mini.hipatterns"

        return {
            highlighters = {
                fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "DiagnosticError" },
                hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "DiagnosticWarn" },
                todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "DiagnosticInfo" },
                note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "DiagnosticHint" },

                hex_color = hipatterns.gen_highlighter.hex_color(),
            },
        }
    end,
}
