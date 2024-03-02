-- Allows for debugging to temp file
-- tail -f /tmp/nvim.jacobc/nvimide.log
-- https://vi.stackexchange.com/questions/42823/how-to-debug-print-when-writing-neovim-lua

nvimide = {
    debug_restart = false,
    debug = true,
    log_fh = nil,
    log = function(...)
        if nvimide.debug then
            local objects = {}
            for i = 1, select('#', ...) do
                local v = select(i, ...)
                table.insert(objects, vim.inspect(v))
            end
            nvimide.log_fh:write(table.concat(objects, '\n') .. '\n')
            nvimide.log_fh:flush()
        end
    end,
    script_path = function()
        return debug.getinfo(2, "S").source:sub(2)
    end,
}
if nvimide.debug then
    nvimide.log_fh = io.open("/tmp/nvim." .. os.getenv("USER") .. "/nvimide.log", nvimide.debug_restart and 'w' or 'a')
end
-- vim.nvimide = nvimide
nvimide.log("Enter " .. nvimide.script_path())
