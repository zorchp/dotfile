## 开始

安装 xcode 的开发工具:

```bash
xcode-select --install

```

配置 git

```bash
ssh-keygen
```

测试

```bash
ssh -T git@github.com
```

## zsh 配置

```bash
echo $0

mkdir ~/.zsh
mkdir ~/.zsh/plugins
mv ~/.zsh_history ~/.zsh/
ln -sf ~/.zsh/.zshrc ~/.zshrc

```

## 安装一些必备的包

```bash
    brew install nvim
    brew install go
    brew install llvm
    brew install rustfmt
    brew install prettier

```

## 字体

```bash
    brew tap homebrew/cask-fonts
    brew install font-jetbrains-mono-nerd-font
```

```bash
    python3 -m pip install pynvim
```
