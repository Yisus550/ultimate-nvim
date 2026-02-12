<div align="center">
<p>
    <a>
      <img alt="Linux" src="https://img.shields.io/badge/Linux-%23.svg?style=flat-square&logo=linux&color=FCC624&logoColor=black" />
    </a>
    <a>
      <img alt="macOS" src="https://img.shields.io/badge/macOS-%23.svg?style=flat-square&logo=apple&color=000000&logoColor=white" />
    </a>
    <a>
      <img alt="Windows" src="https://img.shields.io/badge/Windows-%23.svg?style=flat-square&logo=windows&color=0078D6&logoColor=white" />
    </a>
    <a href="https://github.com/neovim/neovim/releases/tag/stable">
      <img src="https://img.shields.io/badge/Neovim-0.11.5-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=green" alt="Neovim minimum version"/>
    </a>
    <a href="LICENSE">
      <img src="https://img.shields.io/badge/License-MIT-green.svg?style=flat-square" alt="License"/>
    </a>
</p>
</div>

> **📌 Note**: This configuration is based on [jdhao/nvim-config](https://github.com/jdhao/nvim-config) and has been customized with additional features and modifications.

# Introduction

This repository hosts a comprehensive Neovim configuration for Linux, macOS, and Windows.
`init.lua` is the config entry point for terminal Nvim,
and `ginit.vim` is the additional config file for [GUI client of Nvim](https://github.com/neovim/neovim/wiki/Related-projects#gui).

The configurations are heavily documented to make them as clear as possible.
While you can clone the whole repository and use it, it is not recommended.
Good configurations are personal. Everyone should have their own unique config file.
You are encouraged to copy from this repo the parts you want and add them to your own config.

To reduce the possibility of breakage, **this config is only maintained for [the latest nvim stable release](https://github.com/neovim/neovim/releases/tag/stable).
No effort is spent on maintaining backward compatibility.**

# Differences from Original

This configuration includes several enhancements and modifications from the original jdhao/nvim-config:

## Added Plugins

+ **AI Code Assistance**: [copilot.lua](https://github.com/zbirenbaum/copilot.lua) and [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim) for GitHub Copilot integration
+ **Code Context**: [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) for winbar breadcrumbs showing code context
+ **Color Highlighting**: [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua) for hex/RGB color preview
+ **Enhanced Quickfix**: [quicker.nvim](https://github.com/stevearc/quicker.nvim) for improved quickfix window functionality
+ **Colorscheme**: [e-ink.nvim](https://github.com/e-ink-colorscheme/e-ink.nvim) colorscheme option

## Removed Plugins

+ **repmo-vim**: Repeat motion plugin removed
+ **snacks.nvim**: Partial dashboard configuration simplified

## Modified Configurations

+ **nvim-treesitter**: Changed from lazy-loaded (`lazy = true`) to eager loading (`lazy = false`) for immediate syntax highlighting
+ **treesitter-textobjects**: Now enabled (was previously commented out in original)
+ **nvim-ufo**: Fold column changed from `"1"` to `"0"` for cleaner appearance

## New LSP Server Configurations

+ **vtsls.lua**: Dedicated configuration for TypeScript/JavaScript LSP server
+ **ruby_lsp.lua**: Dedicated configuration for Ruby language server

## Keymap Changes

+ **System Clipboard Integration**: `p` and `P` remapped to always paste from system clipboard (`"+p` and `"+P`)
+ **Window Navigation**: Added arrow key bindings (`<Left>`, `<Right>`, `<Up>`, `<Down>`) for window navigation
+ **Buffer Navigation**: Removed `<S-h>` and `<S-l>` mappings for previous/next buffer

# Install and setup

See [doc here](docs/README.md) on how to install Nvim's dependencies, Nvim itself,
and how to set up on different platforms (Linux, macOS, and Windows).

# Features #

+ AI code assistance and chat interface via [copilot.lua](https://github.com/zbirenbaum/copilot.lua) and [CopilotChat.nvim](https://github.com/CopilotC-Nvim/CopilotChat.nvim).
+ Code context breadcrumbs via [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim).
+ Hex/RGB color highlighting via [nvim-colorizer.lua](https://github.com/catgoose/nvim-colorizer.lua).
+ Enhanced quickfix window via [quicker.nvim](https://github.com/stevearc/quicker.nvim).
+ Plugin management via [Lazy.nvim](https://github.com/folke/lazy.nvim).
+ Code, snippet, word auto-completion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp).
+ Language server protocol (LSP) support via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig).
+ Git integration via [vim-fugitive](https://github.com/tpope/vim-fugitive).
+ Better escaping from insert mode via [better-escape.vim](https://github.com/nvim-zh/better-escape.vim).
+ Ultra-fast project-wide fuzzy searching via [fzf-lua](https://github.com/ibhagwan/fzf-lua).
+ Faster code commenting via [vim-commentary](https://github.com/tpope/vim-commentary).
+ Faster matching pair insertion and jump via [nvim-autopairs](https://github.com/windwp/nvim-autopairs).
+ Smarter and faster matching pair management (add, replace or delete) via [vim-sandwich](https://github.com/machakann/vim-sandwich).
+ Fast buffer jump via [hop.nvim](https://github.com/phaazon/hop.nvim).
+ Powerful snippet insertion via [Ultisnips](https://github.com/SirVer/ultisnips).
+ Beautiful statusline via [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim).
+ File tree explorer via [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua).
+ Better quickfix list with [nvim-bqf](https://github.com/kevinhwang91/nvim-bqf).
+ Show search index and count with [nvim-hlslens](https://github.com/kevinhwang91/nvim-hlslens).
+ User-defined mapping hint via [which-key.nvim](https://github.com/folke/which-key.nvim).
+ Asynchronous code execution via [asyncrun.vim](https://github.com/skywind3000/asyncrun.vim).
+ Code highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
+ Code editing using true nvim inside browser via [firenvim](https://github.com/glacambre/firenvim).
+ Beautiful colorscheme via [sainnhe/gruvbox-material](https://github.com/sainnhe/gruvbox-material) and other colorschemes.
+ Markdown previewing via [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)
+ LaTeX editing and previewing via [vimtex](https://github.com/lervag/vimtex)
+ Animated GUI style notification via [nvim-notify](https://github.com/rcarriga/nvim-notify).
+ Tags navigation via [vista](https://github.com/liuchengxu/vista.vim).
+ Undo management via [vim-mundo](https://github.com/simnalamburt/vim-mundo)
+ Code folding with [nvim-ufo](https://github.com/kevinhwang91/nvim-ufo) and [statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)
+ ......

# UI Demo

## Start screen with dashboard-nvim

## File fuzzy finding using fzf-lua

## Code autocompletion with nvim-cmp

## Git add, commit and push via fugitive.vim

## Tags

## Cursor jump via hop.nvim

## GUI-style notification with nvim-notify

## Code folding with nvim-ufo and statuscol.nvim

# Shortcuts

Some of the shortcuts I use frequently are listed here. In the following shortcuts, `<leader>` represents ASCII character `,`.

| Shortcut          | Mode          | platform        | Description                                                              |
|-------------------|---------------|-----------------|--------------------------------------------------------------------------|
| `<leader>ff`      | Normal        | Linux/macOS/Win | Fuzzy file searching in a floating window                                |
| `<leader>fh`      | Normal        | Linux/macOS/Win | Fuzzy help file grepping in a floating window                            |
| `<leader>fg`      | Normal        | Linux/macOS/Win | Fuzzy project-wide grepping in a floating window                         |
| `<leader>ft`      | Normal        | Linux/macOS/Win | Fuzzy buffer tag searching in a floating window                          |
| `<leader>fb`      | Normal        | Linux/macOS/Win | Fuzzy buffer switching in a floating window                              |
| `<leader><Space>` | Normal        | Linux/macOS/Win | Remove trailing white spaces                                             |
| `<leader>v`       | Normal        | Linux/macOS/Win | Reselect last pasted text                                                |
| `<leader>ev`      | Normal        | Linux/macOS/Win | Edit Nvim config in a new tabpage                                        |
| `<leader>sv`      | Normal        | Linux/macOS/Win | Reload Nvim config                                                       |
| `<leader>q`       | Normal        | Linux/macOS/Win | Quit current window                                                      |
| `<leader>Q`       | Normal        | Linux/macOS/Win | Quit all window and close Nvim                                           |
| `<leader>w`       | Normal        | Linux/macOS/Win | Save current buffer content                                              |
| `<leader>y`       | Normal        | Linux/macOS/Win | Copy the content of entire buffer to default register                    |
| `<leader>cl`      | Normal        | Linux/macOS/Win | Toggle cursor column                                                     |
| `<leader>cd`      | Normal        | Linux/macOS/Win | Change current working directory to to the dir of current buffer         |
| `<space>t`        | Normal        | Linux/macOS/Win | Toggle tag window (show project tags in the right window)                |
| `<leader>gs`      | Normal        | Linux/macOS/Win | Show Git status result                                                   |
| `<leader>gw`      | Normal        | Linux/macOS/Win | Run Git add for current file                                             |
| `<leader>gc`      | Normal        | Linux/macOS/Win | Run git commit                                                           |
| `<leader>gpl`     | Normal        | Linux/macOS/Win | Run git pull                                                             |
| `<leader>gpu`     | Normal        | Linux/macOS/Win | Run git push                                                             |
| `<leader>gbd`     | Normal        | Linux/macOS/Win | Delete a branch                                                          |
| `<leader>gbn`     | Normal        | Linux/macOS/Win | Create a new branch                                                      |
| `<leader>gl`      | Normal/Visual | Linux/macOS/Win | Get perm link for current/visually-select lines                          |
| `<leader>gbr`     | Normal        | macOS           | Browse current git repo in browser                                       |
| `<leader>gb`      | Visual        | macOS           | Blame current line                                                       |
| `<F9>`            | Normal        | Linux/macOS/Win | Compile&run current source file (for C++, LaTeX, Lua, Python)            |
| `<F11>`           | Normal        | Linux/macOS/Win | Toggle spell checking                                                    |
| `<F12>`           | Normal        | Linux/macOS/Win | Toggle paste mode                                                        |
| `\x`              | Normal        | Linux/macOS/Win | Close location or quickfix window                                        |
| `\d`              | Normal        | Linux/macOS/Win | Close current buffer and go to previous buffer                           |
| `{count}gb`       | Normal        | Linux/macOS/Win | Go to buffer `{count}` or next buffer in the buffer list.                |
| `{operator}iB`    | Normal        | Linux/macOS/Win | Operate in the whole buffer, `{operator}` can be `v`, `y`, `c`, `d` etc. |
| `Alt-k`           | Normal        | Linux/macOS/Win | Move current line or selected lines up                                   |
| `Alt-j`           | Normal        | Linux/macOS/Win | Move current line or selected lines down                                 |
| `ctrl-u`          | Insert        | Linux/macOS/Win | Turn word under cursor to upper case                                     |
| `ctrl-t`          | Insert        | Linux/macOS/Win | Turn word under cursor to title case                                     |
| `jk`              | Insert        | Linux/macOS/Win | Return to Normal mode without lagging                                    |

# Custom commands

In addition to commands provided by various plugins, I have also created some custom commands for personal use.

| command      | description                                                             | example                        |
|--------------|-------------------------------------------------------------------------|--------------------------------|
| `Redir`      | capture command output to a tabpage for easier inspection.              | `Redir hi`                     |
| `Edit`       | edit multiple files at the same time, supports globing                  | `Edit *.vim`                   |
| `Datetime`   | print current date and time or convert Unix time stamp to date and time | `Datetime 12345` or `Datetime` |
| `JSONFormat` | format a JSON file                                                      | `JSONFormat`                   |
| `CopyPath`   | copy current file path to clipboard                                     | `CopyPath relative`            |

# Contributing

Contributions and suggestions are welcome. If you find anything that needs improving, feel free to open an issue or submit a pull request.

If you encounter problems, use the `:checkhealth` command in Neovim to troubleshoot common issues.

# Credits and Acknowledgments

This configuration is based on the excellent work of **[Jiedong Hao (jdhao)](https://github.com/jdhao)**.

+ **Original Repository**: [jdhao/nvim-config](https://github.com/jdhao/nvim-config)
+ **Author's Blog**: [https://jdhao.github.io/](https://jdhao.github.io/)
+ **Neovim Resources**: See [docs/nvim_resources.md](docs/nvim_resources.md) for helpful Neovim learning materials

This configuration maintains the original **MIT License** from the base project.

Special thanks to jdhao for creating and maintaining such a comprehensive and well-documented Neovim configuration that serves as an excellent foundation for customization.
