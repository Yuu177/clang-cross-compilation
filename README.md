[TOC]

# Cross-compilation using Clang

下面这篇文档中介绍了 Clang 交叉编译的相关内容，同时对比了 GCC 交叉编译的区别：

https://getting-started-with-llvm-core-libraries-zh-cn.readthedocs.io/zh-cn/latest/ch08.html#gccllvm

但是文档中（包括网上查询到的资料文档）并没有具体代码实战。该仓库目的就是用一个简单的代码示例去展示 Clang 交叉编译的过程（实战踩了不少坑）。毕竟「纸上得来终觉浅，绝知此事要躬行」。

## 环境配置

- Win11 使用 WSL2 安装「本地操作系统」：`Ubuntu-20.04-x86_64`
- Win11 使用虚拟机 QEMU 安装「目标操作系统」：`Ubuntu-16.04-ARM64`

### 使用虚拟机 QEMU 安装目标操作系统

>Ubuntu-16.04-ARM64

安装文档：https://gist.github.com/billti/d904fd6124bf6f10ba2c1e3736f0f0f7

把需要用到的 Ubuntu 镜像，`UEI.fd` 和 `user-data.img` 文件放在同一个目录下。然后在这个目录下执行安装虚拟机命令，等待完成安装即可。

安装完成后无法直接在当前终端窗口登录（即使用户名和密码输入正确也会报 Login incorrect 错误），需要重新打开一个新的终端窗口，输入 `ssh ubuntu@localhost -p 2222`，密码 `asdfqwer` 来进行登录。

### 本地操作系统配置

>Ubuntu-20.04-x86_64

- 下载 ARM64 Linux GCC 工具链

https://developer.arm.com/downloads/-/gnu-a

代码中用的 GCC 版本如下：

```
gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu.tar.xz
```

- 安装 Clang

```bash
sudo apt install clang
```

也指定安装 Clang 版本。下面以安装 clang-18 举例：

```bash
wget https://apt.llvm.org/llvm.sh
chmod u+x llvm.sh
sudo ./llvm.sh 18
```

使用 `clang --version` 命令检查 Clang 安装是否成功

```bash
clang version 10.0.0-4ubuntu1
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
```

## Usage

- 执行交叉编译脚本

执行仓库中的 build 脚本：使用 Clang 交叉编译代码，生成 ARM64 Linux 可执行文件。

- 上传该可执行文件到「目标操作系统」上

在 WSL 中使用 `scp` 命令把可执行文件传输到 ARM Linux 上。

```bash
 scp -P 2222 <file> ubuntu@localhost:~/
```

- 在「目标操作系统」运行该可执行程序

## 参考

- [Cross compilation with Clang and LLVM tools](https://static.linaro.org/connect/bkk19/presentations/bkk19-210.pdf)
- https://github.com/microsoft/SymCrypt/blob/main/cmake-configs/Toolchain-Clang-ARM64.cmake

