#!/bin/bash

# 1. golangci-lintをインストールする
echo "Installing golangci-lint..."

curl -sSf https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh

# 2. インストールされたgolangci-lintのパスを確認
INSTALL_DIR="$HOME/bin"
if [ ! -d "$INSTALL_DIR" ]; then
    mkdir -p "$INSTALL_DIR"
fi

# 3. ~/bin にgolangci-lintがインストールされたか確認
if [ -f "$INSTALL_DIR/golangci-lint" ]; then
    echo "golangci-lint is installed successfully at $INSTALL_DIR"
else
    echo "golangci-lint installation failed."
    exit 1
fi

# 4. ~/.zshrc に $PATH を追加
echo "Adding $HOME/bin to the PATH in ~/.zshrc..."

if ! grep -q "$HOME/bin" ~/.zshrc; then
    echo 'export PATH="$HOME/bin:$PATH"' >> ~/.zshrc
    echo "$HOME/bin has been added to your PATH."
else
    echo "$HOME/bin is already in your PATH."
fi

# 5. 設定を反映するためにzshrcを再読み込み
echo "Reloading .zshrc..."
source ~/.zshrc

# 6. 最終確認
echo "Verifying golangci-lint installation..."
golangci-lint --version

echo "Installation and setup complete!"

