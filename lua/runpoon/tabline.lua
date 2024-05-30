local Dev = require("runpoon.dev")
local log = Dev.log

local M = {}

local function get_color(group, attr)
    return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(group)), attr)
end


local function shorten_filenames(filenames)
    local shortened = {}

    local counts = {}
    for _, file in ipairs(filenames) do
        local name = vim.fn.fnamemodify(file.filename, ":t")
        counts[name] = (counts[name] or 0) + 1
    end

    for _, file in ipairs(filenames) do
        local name = vim.fn.fnamemodify(file.filename, ":t")

        if counts[name] == 1 then
            table.insert(shortened, { filename = vim.fn.fnamemodify(name, ":t") })
        else
            table.insert(shortened, { filename = file.filename })
        end
    end

    return shortened
end

function M.setup(opts)
    function _G.tabline()
        local tabs = shorten_filenames(require('runpoon').get_mark_config().marks)
        local tabline = ''

        local index = require('runpoon.mark').get_index_of(vim.fn.bufname())

        for i, tab in ipairs(tabs) do
            local is_current = i == index

            local label

            if tab.filename == "" or tab.filename == "(empty)" then
                label = "(empty)"
                is_current = false
            else
                label = tab.filename
            end


            if is_current then
                tabline = tabline ..
                    '%#runpoonNumberActive#' .. (opts.tabline_prefix or '   ') .. i .. ' %*' .. '%#runpoonActive#'
            else
                tabline = tabline ..
                    '%#runpoonNumberInactive#' .. (opts.tabline_prefix or '   ') .. i .. ' %*' .. '%#runpoonInactive#'
            end

            tabline = tabline .. label .. (opts.tabline_suffix or '   ') .. '%*'

            if i < #tabs then
                tabline = tabline .. '%T'
            end
        end

        return tabline
    end

    vim.opt.showtabline = 2

    vim.o.tabline = '%!v:lua.tabline()'

    vim.api.nvim_create_autocmd("ColorScheme", {
        group = vim.api.nvim_create_augroup("runpoon", { clear = true }),
        pattern = { "*" },
        callback = function()
            local color = get_color('runpoonActive', 'bg#')

            if (color == "" or color == nil) then
                vim.api.nvim_set_hl(0, "runpoonInactive", { link = "Tabline" })
                vim.api.nvim_set_hl(0, "runpoonActive", { link = "TablineSel" })
                vim.api.nvim_set_hl(0, "runpoonNumberActive", { link = "TablineSel" })
                vim.api.nvim_set_hl(0, "runpoonNumberInactive", { link = "Tabline" })
            end
        end,
    })

    log.debug("setup(): Tabline Setup", opts)
end

return M
