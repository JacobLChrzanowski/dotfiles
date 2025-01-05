-- ~/.config/nvim/lua/greeter/init.lua
local M = {}

local config_file = vim.fn.stdpath('config') .. '/names.json'

-- Private functions
local function read_json_file(file_path)
    local file = io.open(file_path, "r")
    if file then
        local content = file:read("*all")
        file:close()
        -- Parse JSON content
        local ok, result = pcall(vim.fn.json_decode, content)
        if ok then
            return result
        end
        vim.notify("Error parsing JSON: " .. tostring(result), "error")
    end
    return nil
end

local function write_json_file(file_path, data)
    local file = io.open(file_path, "w")
    if file then
        -- Convert to JSON format
        local ok, json_str = pcall(vim.fn.json_encode, data)
        if ok then
            file:write(json_str)
            file:close()
            return true
        end
        file:close()
        vim.notify("Error converting to JSON: " .. tostring(json_str), "error")
    end
    return false
end

local function get_random_name(names)
    if #names == 0 then return nil end
    return names[math.random(1, #names)]
end

-- Module variables
local function get_default_names()
    local names = {}
    local username = os.getenv("USER")
    if username and #username > 0 then
        table.insert(names, username)
    end
    local hostname = vim.loop.os_gethostname()
    if hostname and #hostname > 0 then
        table.insert(names, hostname)
    end
    return names
end

-- Initialize and display greeting
local function init()
    -- Ensure randomization
    math.randomseed(os.time())
    
    -- Check and load names
    local json_content = read_json_file(config_file)
    local names
    
    if not json_content then
        -- File doesn't exist or couldn't be read, create it with defaults
        local default_names = get_default_names()
        write_json_file(config_file, default_names)
        names = default_names
        vim.notify("Created new names.json with default values", "info")
    else
        names = json_content
        if not names then
            -- File exists but doesn't have the expected structure
            write_json_file(config_file, default_names)
            names = default_names
            vim.notify("Reset names.json to default values due to invalid format", "warn")
        end
    end
    
    -- Display random greeting
    local chosen_name = get_random_name(names)
    if chosen_name then
        vim.notify("Welcome, " .. chosen_name .. "!", "info", {
            title = "Greeter",
            timeout = 3000,
            animate = true
        })
    end
end

-- Auto-initialize when the module is required
init()

return M
