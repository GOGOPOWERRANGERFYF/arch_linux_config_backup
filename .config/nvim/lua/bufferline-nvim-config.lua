require('bufferline').setup {
    options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead
        --numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        numbers = "both",
        close_command = "bdelete! %d",       -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
        indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            --style = 'icon' | 'underline' | 'none',
            style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        --- name_formatter can be used to change the buffer's label in the bufferline.
        --- Please note some names can/will break the
        --- bufferline so use this at your discretion knowing that it has
        --- some limitations that will *NOT* be fixed.
        name_formatter = function(buf)  -- buf contains:
              -- name                | str        | the basename of the active file
              -- path                | str        | the full path of the active file
              -- bufnr (buffer only) | int        | the number of the active buffer
              -- buffers (tabs only) | table(int) | the numbers of the buffers in the tab
              -- tabnr (tabs only)   | int        | the "handle" of the tab, can be converted to its ordinal number using: `vim.api.nvim_tabpage_get_number(buf.tabnr)`
        end,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        truncate_names = true, -- whether or not tab names should be truncated
        tab_size = 18,
        --diagnostics = false | "nvim_lsp" | "coc",
        diagnostics = "nvim_lsp",
        --diagnostics_update_in_insert = false,
        diagnostics_update_in_insert = true,
        -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
        --diagnostics_indicator = function(count, level, diagnostics_dict, context)
        --    return "("..count..")"
        --end,
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or ""
            return " " .. icon .. count
        end,
        -- NOTE: this will be called a lot so don't do any heavy processing here
        custom_filter = function(buf_number, buf_numbers)
            -- filter out filetypes you don't want to see
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- filter out by buffer name
            if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
                return true
            end
            -- filter out based on arbitrary rules
            -- e.g. filter out vim wiki buffer from tabline in your work repo
            if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
                return true
            end
            -- filter out by it's index number in list (don't show first buffer)
            if buf_numbers[1] ~= buf_number then
                return true
            end
        end,
        offsets = {
            {
                filetype = "NvimTree",
                --text = "File Explorer" | function ,
                text = "File Explorer",
                --text_align = "left" | "center" | "right"
                text_align = "left",
                separator = true
            }
        },
        --color_icons = true | false, -- whether or not to add the filetype icon highlights
        color_icons = true,
        --show_buffer_icons = true | false, -- disable filetype icons for buffers
        show_buffer_icons = true,
        --show_buffer_close_icons = true | false,
        show_buffer_close_icons = true,
        --show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
        show_buffer_default_icon = true,
        --show_close_icon = true | false,
        show_close_icon = true,
        --show_tab_indicators = true | false,
        show_tab_indicators = true,
        --show_duplicate_prefix = true | false, -- whether to show duplicate buffer prefix
        show_duplicate_prefix = true,
        --persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        persist_buffer_sort = true,
        -- can also be a table containing 2 custom separators
        -- [focused and unfocused]. eg: { '|', '|' }
        --separator_style = "slant" | "thick" | "thin" | { 'any', 'any' },
        separator_style = "slant",
        --enforce_regular_tabs = false | true,
        enforce_regular_tabs = true,
        --always_show_bufferline = true | false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        --sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
        --    -- add custom logic
        --    return buffer_a.modified > buffer_b.modified
        --end
        sort_by = 'insert_after_current',
    }
}

-- 快捷键 --
--     vim.api.nvim_set_keymap('模式', '按键', '映射为..', option)
-- 按键:
--     <CR> 回车换行；<sapce> 空格键；<F2> F2键；
--     <A><M>两都表示Alt键
-- 选项:
--     silent 表示执行命令时不回显内容?;
--     noremap 禁止递归;
-- 模式:
--     '' 所有模式；'n' 普通模式；'v' 可视模式；'i' 插入模式；'s' 选择模式；'c' 命令模式.
--vim.api.nvim_set_keymap('n', '<F2>', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
--

-- %表示当前buffer,#表示下一个buffer,所以bd #不能删除最后一个buffer.bdelete!为强制删除,
-- 关闭当前的buffer,能删除最后一个buffer,但存在空的tab且有存在窗口布局变动问题,
--vim.api.nvim_set_keymap('n',"<A-c>", ":bp | bdelete %<CR>", {noremap = true, silent = true})
-- 用下面的命令没窗口布局问题,但无法删除最后一个buffer,那最后一个buffer关闭文件树后用:q命令吧...
vim.api.nvim_set_keymap('n',"<A-c>", ":bp | bdelete #<CR>", {noremap = true, silent = true})

--选择前一个和后一个标签
vim.api.nvim_set_keymap('n',"<A-h>", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-l>", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
--bufferline可见标签的选择快捷键,打开太多文件bl显示的tag是有限的
vim.api.nvim_set_keymap('n',"<A-1>", ":BufferLineGoToBuffer 1<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-2>", ":BufferLineGoToBuffer 2<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-3>", ":BufferLineGoToBuffer 3<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-4>", ":BufferLineGoToBuffer 4<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-5>", ":BufferLineGoToBuffer 5<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-6>", ":BufferLineGoToBuffer 6<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-7>", ":BufferLineGoToBuffer 7<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-8>", ":BufferLineGoToBuffer 8<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap('n',"<A-9>", ":BufferLineGoToBuffer 9<CR>", {noremap = true, silent = true})
-- 可见标签的最后一个
vim.api.nvim_set_keymap('n',"<A-0>", ":BufferLineGoToBuffer -1<CR>", {noremap = true, silent = true})

-- 命令都不起作用...?
--vim.api.nvim_set_keymap('n', '<A-1>', ':lua require("bufferline").go_to_buffer(1, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-2>', ':lua require("bufferline").go_to_buffer(2, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-3>', ':lua require("bufferline").go_to_buffer(3, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-4>', ':lua require("bufferline").go_to_buffer(4, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-5>', ':lua require("bufferline").go_to_buffer(5, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-6>', ':lua require("bufferline").go_to_buffer(6, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-7>', ':lua require("bufferline").go_to_buffer(7, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-8>', ':lua require("bufferline").go_to_buffer(8, true)<cr>', {noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<A-9>', ':lua require("bufferline").go_to_buffer(9, true)<cr>', {noremap = true, silent = true})


