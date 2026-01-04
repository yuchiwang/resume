# github Codespaces
Code -> Codespaces

# 确认cpu架构
`lscpu`

应输出Architecture:             x86_64

# 安装typst
```bash
curl -L https://github.com/typst/typst/releases/latest/download/typst-x86_64-unknown-linux-musl.tar.xz | tar -xJ

cd typst-x86_64-unknown-linux-musl

sudo cp typst /usr/local/bin/

typst --version
```

# 安装字体
```bash
# 安装 Source Han Serif（思源宋体）
sudo apt update
sudo apt install fonts-noto-cjk

# 安装 Palatino 的替代字体（TeX Gyre Pagella）
sudo apt install fonts-texgyre

```
