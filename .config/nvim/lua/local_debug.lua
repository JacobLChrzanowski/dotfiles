-- Allows for debugging to temp file
-- tail -f /tmp/nvim.jacobc/nvimide.log
-- https://vi.stackexchange.com/questions/42823/how-to-debug-print-when-writing-neovim-lua

-- Define nvimide as a global table
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
            if nvimide.log_fh then -- Check if log file handle is initialized
                nvimide.log_fh:write(table.concat(objects, '\n') .. '\n')
                nvimide.log_fh:flush()
            end
        end
    end,
    script_path = function()
        return debug.getinfo(2, "S").source:sub(2)
    end,
}

-- Create log directory if it doesn't exist
local log_dir = "/tmp/nvim." .. os.getenv("USER")
-- print(nvimide.debug)
-- print(vim.fn.isdirectory(log_dir))
if (nvimide.debug) then
    if (vim.fn.isdirectory(log_dir) == 0) then
        local success = vim.fn.mkdir(log_dir, "p")
        if success == 0 then
            print("Error: Unable to create log directory.")
        end
    end

    -- Open log file if debugging is enabled
    nvimide.log_fh = io.open(log_dir .. "/nvimide.log", nvimide.debug_restart and 'w' or 'a')
    if not nvimide.log_fh then
        print("Error: Unable to open log file.")
    end
end
--
-- Log script entry
nvimide.log("Enter " .. nvimide.script_path())
