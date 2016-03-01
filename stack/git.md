#Git 教程
##建立一个仓库


这个教程提供了一个关于最重要的Git命令的简明概述.首先,仓库建立这一章说明了需要开始一个新的版本控制项目所需要的所有工具.其次,剩下的章节介绍了你每日必须要使用的Git命令.


最后,你将可以创建一个Git仓库,为自己的项目创建安全的快照,浏览项目的历史记录.

###git init

`git init`命令创建一个新的Git仓库,可以以来改变一个已存在的非版本控制的项目成Git仓库,或者初始化一个新的空仓库.大多是其他的Git命令在初始化仓库以外是不可以使用的,所以这通常是在新项目里使用的第一个命令.


执行`git init`将在项目根目录创建一个`.git`子目录,其中包含了这个仓库所有必须的数据.撇开这一个`.git`目录,一个已存在的项目快照被保留下来了(不同于SVN,Git不需要每一个子目录中都含有`.git`目录).




Q: How to build from source in ubuntu?
A:
```sh
sudo apt-get install libcurl4-gnutls-dev
make prefix=/usr/local all
sudo make prefix=/usr/local install
```


Q: How to combine git commits?

A: if you want combine three commits into one,you can do like this:
```
git rebase -i HEAD~3
replace "pick" on the second and subsequent commits with "squash" or "fixup"
```
also in new version git we also can use git rebase -i @~3.


Q: How to fix git cannot lock ref
A:
```sh
rm .git/refs/remotes/origin/master
git fetch
```

Q: How do I make git use the editor of my choice for commits?

A: `git config --global core.editor "nvim"`
