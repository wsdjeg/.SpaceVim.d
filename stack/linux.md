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
