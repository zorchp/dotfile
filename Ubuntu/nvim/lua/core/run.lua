local function CodeRunner()
    --[===[========================== Global ===========================]===]
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        callback = function()
            vim.fn.execute("silent! write")
            vim.notify("Autosaved!", vim.log.levels.INFO, {})
        end,
    })

    --[===[========================== Static ===========================]===]
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "c",
        callback = function()
            -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te gcc -Wshadow -Wall  -o %:t:r.out %  && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F8>",
                -- "<ESC>:w<CR>:split<CR>:te /usr/bin/clang-12 -Wshadow -Wall -std=c11 -o %:t:r.out % && time ./%:t:r.out<CR>",
                "<ESC>:w<CR>:split<CR>:te /usr/bin/clang-12 -Wshadow -Wall  -o %:t:r.out % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te gcc -Wshadow -Wall  -o %:t:r.out % && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F8>",
                -- "<ESC>:w<CR>:split<CR>:te /usr/bin/clang-12 -Wshadow -Wall -std=c11 -o %:t:r.out % && time ./%:t:r.out<CR>",
                "<ESC>:w<CR>:split<CR>:te /usr/bin/clang-12 -Wshadow -Wall  -o %:t:r.out % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cpp",
        callback = function()
            -- -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te g++ -std=c++20 -Wshadow -Wall -o %:t:r.out %  && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F8>",
                "<ESC>:w<CR>:split<CR>:te /usr/bin/clang++-12 -std=c++20 -Wshadow -Wall -o %:t:r.out % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>",
                -- "<ESC>:w<CR>:split<CR>:te /usr/bin/clang++-12 -std=c++20 -Wshadow -Wall -o %:t:r.out % && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te g++ -std=c++20 -Wshadow -Wall -o %:t:r.out %  && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F8>",
                -- "<ESC>:w<CR>:split<CR>:te /usr/bin/clang++-12 -std=c++20 -Wshadow -Wall -o %:t:r.out % && time ./%:t:r.out<CR>",
                "<ESC>:w<CR>:split<CR>:te /usr/bin/clang++-12 -std=c++20 -Wshadow -Wall -o %:t:r.out % -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG && time ./%:t:r.out<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    --[===[=========================== Script ==========================]===]
    --
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                ":w<CR>:split<CR>:te time python3 %<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te time python3 %<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "lua",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te lua %<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                ":w<CR>:split<CR>:te lua %<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "make",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te make <CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F8>",
                "<ESC>:w<CR>:split<CR>:te make clean<CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te make <CR>i",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F8>",
                "<ESC>:w<CR>:split<CR>:te make clean<CR>i",
                { silent = true, noremap = true }
            )
        end,
    })
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cmake",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te cmake .<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "shell",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te bash %<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te bash %<CR>",
                { silent = true, noremap = true }
            )
        end,
    })

    --[===[==================== TypeWritting ===================]===]
    --
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "tex",
        callback = function()
            vim.api.nvim_buf_set_keymap(
                0,
                "i",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te latexmk %<CR>",
                { silent = true, noremap = true }
            )
            vim.api.nvim_buf_set_keymap(
                0,
                "n",
                "<F7>",
                "<ESC>:w<CR>:split<CR>:te latexmk %<CR>",
                { silent = true, noremap = true }
            )
            -- vim.fn.writefile(
            --     {vim.fn.execute(":echo v:servername", "silent")},
            --     "/tmp/vimtexserver.txt")
        end,
    })
end

CodeRunner()
