# Neovim Configuration

This repository contains my personal Neovim configuration using Lua.

## Installation

1. Clone this repository to your Neovim configuration directory:

    ```sh
    git clone https://github.com/tofustream/nvim.git ~/.config/nvim
    ```

2. Open Neovim and install the plugins using `packer.nvim`:

    ```sh
    nvim +PackerSync
    ```

## Features

- **Treesitter**: Enhanced syntax highlighting.
- **LSP**: Language Server Protocol configuration for better code intelligence.
- **Autocompletion**: Using `nvim-cmp` for code completion.
- **Auto Pairs**: Automatically close brackets and quotes.
- **Null-ls**: Code formatting and linting.
- **DAP**: Debug Adapter Protocol for debugging support.
- **Commenting**: Easy commenting with `nvim-comment`.
- **GitHub Copilot**: AI-powered code suggestions.

## Key Mappings

- **GitHub Copilot**: Accept suggestions with `<C-J>`.

## Configuration Details

### LSP Configuration

- **gopls**: Configuration for Go language server.

### Null-ls Configuration

- **Formatting**: `gofmt`, `goimports`
- **Diagnostics**: `golangci_lint`

### DAP Configuration

- **Go Debugging**: Configuration for debugging Go applications.

### Autocompletion Configuration

- **Sources**: `nvim_lsp`, `buffer`, `path`

### Treesitter Configuration

- **Languages**: `go`, `gomod`

### Other Settings

- **Tab and Space Visualization**
- **Tab Size**: Set to 4 spaces

## License

This project is licensed under the MIT License.