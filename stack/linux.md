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
pip3 install --user neovim
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





