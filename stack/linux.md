Q:How to write fu! in one line
A:
```
21:52 < wsdjeg> how could I defind a func in command line? I just try `:fu! Test() | endf` but it does not work, I get E488,
22:04 < MarcoHinzGitter[> wsdjeg: Either you use `<c-v><c-j>` instead of `|` or something like: `:exe "fu! Test() \n echo 'foo' \n endfu`.
22:05 < MarcoHinzGitter[> I can also use `<c-2>` instead of `<c-v><c-j>`, but that might be different depending on your layout.
22:08 < wsdjeg> @mhinz greate that works well
```
Q:What is the vimscript style guide?
A:https://google.github.io/styleguide/vimscriptfull.xml
  https://google.github.io/styleguide/vimscriptguide.xml
  https://github.com/noahfrederick/vim-scripting-style-guide/blob/master/doc/scripting-style.txt

Q:Why do not use gradle wapper?
A:https://github.com/elastic/elasticsearch/pull/13744

Q:how to find a package in archlinux;
A:pkgfile is a tool to find out what package owns a file, even if said package is not installed. pacman -S pkgfile; pkgfile -u; pkgfile -s <file>
A:use `pacman -Fs file`, before this you need `sudo pacman -Fyu`

Q:archlinux enbale sound in archlinux;
A:`sudo pacman -S pulseaudio`

Q:`dmesg` show me `Failed to activate swap /dev/sda2.` and `Dependency failed for Swap`.
A: use UUID in /etc/fstab instead of `SWAP`.
1. `free -m`, you will see `swap : 0 0 0`,
2. `sudo mkswap /dev/sda2`, you will see something like:
```
Setting up swapspace version 1, size = 4 GiB (4294963200 bytes)
no label, UUID=836b551a-6814-437c-a3f4-edf2a498f51a
```
3. edite `/etc/fstab`, add :
```
# UUID=836b551a-6814-437c-a3f4-edf2a498f51a
/dev/sda2		swap		swap		default 0 0
```
4. `sudo swapon -a`
5. `free -m`, check the swap size.

Q:command for system log?
A: `dmesg` and `journalctl`

Q:How to set localtime in archlinux?
A:
```sh
sudo ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
sudo hwclock -s --localtime
sudo hwclock -w --localtime 
```

Q:archlinux issri issue about Text::CharWidth module(adv_windowlist);
A:`sudo pacman -S perl-text-charwidth`

Q:archlinux issri issue about Date::Format module(queryresume);
A:`sudo pacman -S perl-timedate`

Q:termite true color support;
A:`./configure --with-gtk=3.0`,then build from source

Q:How long you need to startup your os?
A:systemd-analyze time
you will get some info like this:
`Startup finished in 8.107s (kernel) + 29.343s (userspace) = 37.450s`

Q:How to delete the desktop icon?
A:
```bash
sudo rm /usr/share/applications/gvim.desktop
sudo rm /usr/share/applications/vim.desktop
```

Q:how to install neovim in ubuntu?
A:
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
sudo apt-get install python python3 python-dev python3-dev python-pip python3-pip
pip2 install --user neovim
pip2 install --upgrade --user neovim
pip3 install --user neovim
pip3 install --upgrade --user neovim
```

Q:How to install vim with python and lua?
A:
install vim with lua e.g.
```sh
sudo apt-get install vim-gtk
# after install gvim you also can use vim in terminal
```

Q:How to build vim from source?
A:
> I have enable both py and py3
```bash
sudo apt-get build-dep vim
git clone https://github.com/vim/vim.git ~/forks/vim
cd ~/forks/vim
## make distclean && make clean
## build script from this repo
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install
```

Q:How to build irssi from source?
A:
```sh
git clone https://github.com/irssi/irssi
./configure --enable-true-color
make
sudo make install
```

Q:How to fix mysql chinese support?
A:
add into my.cnf(/etc/mysql/my.cnf)
```
[mysql]
default-character-set=utf8
[mysqld]
character-set-server=utf8
```
restart server
```sh
sudo /etc/init.d/mysql stop
sudo /etc/init.d/mysql start
```

Q: How to make ubuntu usb disk
A:
1. Windows [win32diskimager](https://wiki.ubuntu.com/Win32DiskImager/)  [download](https://sourceforge.net/projects/win32diskimager/files/latest/download?source=navbar)
2. ubuntu tools from itself


install android sdk
```sh
cd ~
mkdir tools
cd tools
wget https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz
tar -zxvf android-sdk_r24.4.1-linux.tgz
```





## For irssi (Get token from irc.gitter.im)
```sh
sudo apt-get install irssi
# /connect -ssl irc.gitter.im 6697 token nick
# /join neovim/neovim
```


### true color terminal in ubuntu 14.04
```sh
sudo add-apt-repository ppa:gnome3-team/gnome3-staging
sudo apt-get update
sudo apt-get install gnome-terminal
sudo add-apt-repository -r ppa:gnome3-team/gnome3-staging

```

### Install fcitx in ubuntu 14.04

```sh
sudo apt-get install fcitx fcitx-pinyin
```

### Install latest version ag
```sh
sudo add-apt-repository ppa:jonathonf/backports
sudo apt-get update
sudo apt-get install silversearcher-ag
```
### Install jdk

 `sudo apt-get install openjdk-8-jdk openjdk-8-doc openjdk-8-source`

## Other tools

Screen catch

Kazam
```sh
sudo apt-get install kazam
```

### Example usage of su and sudo
[Example usage of su and sudo](http://zebralinux.blog.51cto.com/8627088/1369301)


### How to show emoji in terminal?
A: archlinux `sudo pacman -S noto-fonts-emoji`

设定开机啟动项
exec /usr/local/bin/compton -CGb #设定透明化啟动
exec /usr/local/bin/fcitx -r & #设定输入法啟动
exec /usr/local/bin/feh --bg-scale  path/123.jpeg  #设定桌面背景
设定透明化
建立~/.compton.conf档，我参考以下网址设定并  i3bar设定透明化
http点://log4think点com/tag/compton/
https点://github点com/chjj/compton/issues/202

啟动lxappearance指定gtk程序的样式及额外设定
~/.Xresources中加入    Xcursor.theme: 主题名称   指定鼠标主题  鼠标主题放置~/.icons/  字体设定可自行研究

建立下载、文件等目录
运行命令xdg-user-dirs-update并且修改~/.config/user-dirs.dirs档指定目录名称

图片浏览器可用viewnior   请依照使用喜好来安装额外套件

4.~/.xprofile参考
#input method
export XIM="fcitx"
export XMODIFIERS='@im=fcitx'
export GTK_IM_MODULE=fcitx
export GTK3_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export QT4_IM_MODULE=fcitx
export XIM_PROGRAM=fcitx

目前只懂这些   小小的分享   还在调整中   dmenu desktop档使用我就不想搞了   dmenu运行命令即可
桌面拍照我使用scrot命令并在~/.i3/config中指定快捷键  感觉使用上并不深入   以下拍照参考  只是基础调校
小弟懂的并不多  献丑一下


##6/28更新
#萤幕锁定
#pkg install xautolock
#范例
#~/.i3/config中加入
#exec xautolock -time 1 -locker 'i3lock -f -p default -i $HOME/桌布/123.png' &
#-time指定分钟  -i指定桌布  -f指定纪录密码输入错误次数  -p default指定鼠标
#~/.i3/config设定快捷范例
#bindsym Mod4+o exec i3lock -f -p default -i $HOME/桌布/123.png

##7/3更新
#终端可用vte   不用安装xfce的依赖   vte3也ok   支持透明化  可--help查看详细状况
#ctrl+insert 复制
#shift+insert 黏贴

Q: how to write shell script?

```sh
cat /usr/local/bin/pm
#!/bin/sh
lock() {
    i3lock
}

case "$1" in
    lock)
        lock
        ;;
    logout)
        i3-msg exit
        ;;
    suspend)
        lock && systemctl suspend
        ;;
    hibernate)
        lock && systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 2
esac

exit 0
$ sudo chmod 755 /usr/local/bin/pm
```

### Install ruby

sudo pacman -S ruby
```
The default location of gem installs is $HOME/.gem/ruby
Add the following line to your PATH if you plan to install using gem
$(ruby -rubygems -e "puts Gem.user_dir")/bin
If you want to install to the system wide location, you must either:
edit /etc/gemrc or run gem with the --no-user-install flag.
Optional dependencies for ruby
ruby-docs: Ruby documentation
tk: for Ruby/TK
```

**code search tools for developers**
https://beyondgrep.com/more-tools/

how to check what terminal is useing

`which $(ps -o 'cmd=' -p $(ps -o 'ppid=' -p $$))`

how to mount usb in terminal?
1. `sudo fdisk -l` to see the drivers.
2. `sudo mount /dev/sda1 /mnt/` to mount usb
3. `df -kh` to view the filesystem

How to set gamma?
1. `xrandr` will list all
2. `xrandr -s` select the gramma you need.


how to clear git https username and password?
`git config --global --unset credential.helper`

how to install vimdoc?

```
git clone https://github.com/google/vimdoc.git
python setup.py config
python setup.py build
python setup.py install --user
```


install gi lib for python3?

```
sudo pacman -S python-gobject
```

how to install php-msgpack in arch?

```sh
git clone https://aur.archlinux.org/packages/php-msgpack/
makepkg -isr
```

how to build ycm in archlinux?

```sh
# use system clang instead of download clang 5.0
# to install xbuild, you need to install extra/mono
./install.sh --clang-completer --system-libclang
```


how to search file insteaded via pacman?
```
pacman -Qlq package | grep -v '/$' | xargs du -h | sort -h
```

Q: how to print windows info in linux?

```
xwininfo 和 xprop，返回信息侧重不同，按需求选。
```

" TODO: 加入全半角转化
" https://blog.csdn.net/u012968002/article/details/64440836
" http://www.cnblogs.com/kaituorensheng/p/3554571.html
" https://blog.csdn.net/yuan892173701/article/details/8731490

Ubuntu 16.04 新机器加用户，并快速搭建机器人！

```
$ curl -O https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz  
$ tar -C /usr/local -zxvf go1.9.linux-amd64.tar.gz  
$ mkdir -p ~/go/src  
$ echo "export GOPATH=$HOME/go" >> ~/.bashrc  
$ echo "export PATH=$PATH:$GOPATH/bin:/usr/local/go/bin" >> ~/.bashrc  
$ source ~/.bashrc  
$ go version 
```

Q: How to fuck archlinux shutdown?

```
systemctl mask mkinitcpio-generate-shutdown-ramfs.service
```

Q: Failed to connect to X server?

I am using nvidia GT 520M, just replace package `nvidia` with `nvidia-390xx`, the error log is:

```
sudo pacman -R nvidia
sudo pacman -Syu nvidia-390xx
```

Q: Failed to install purescript in archlinux?

The problem is Arch uses ncurses6 where as PS is using ncurses5.
I was able to build PS from sources and that worked, but then when I tried to
use pulp init it failed saying it couldn't find libtinfo.so.5. The solution
ncurses 5 was to install ncurses5-compat-libs after doing so now pulp 
init worked with my purs compiled from sources.

```
sudo pacman -S ncurses5-compat-libs
npm install -g purescript
```
