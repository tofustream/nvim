# Neovim Configuration

This repository contains my personal Neovim configuration using Lua.

## Installation

1. Clone this repository to your Neovim configuration directory:

    ```sh
    git clone https://github.com/tofustream/nvim.git ~/.config/nvim
    ```

2. Open Neovim and install the plugins using `packer.nvim`:

    ```sh
    cd ~/.config/nvim
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

## Additional Setup for Go Development

This configuration relies on several tools that need to be installed for the best experience, including `golangci-lint` for linting Go code.

To automatically install and configure `golangci-lint` and set up your environment, you can use the provided installation script:

### `install_golangci_lint_zsh.sh`

This script automates the installation of `golangci-lint` and adds the necessary directories to your `$PATH`. It works specifically for `zsh` users.

#### Usage:

1. Download the script:

    ```sh
    curl -O https://raw.githubusercontent.com/tofustream/nvim/main/install_golangci_lint_zsh.sh
    ```

2. Make the script executable:

    ```sh
    chmod +x install_golangci_lint_zsh.sh
    ```

3. Run the script:

    ```sh
    ./install_golangci_lint_zsh.sh
    ```

This will install `golangci-lint`, configure it to be accessible from the terminal, and ensure that it works seamlessly with your Neovim setup.

## License

This project is licensed under the MIT License.
