#Git 教程
##建立一个仓库


这个教程提供了一个关于最重要的Git命令的简明概述.首先,仓库建立这一章说明了需要开始一个新的版本控制项目所需要的所有工具.其次,剩下的章节介绍了你每日必须要使用的Git命令.


最后,你将可以创建一个Git仓库,为自己的项目创建安全的快照,浏览项目的历史记录.

###git init

`git init`命令创建一个新的Git仓库,可以以来改变一个已存在的非版本控制的项目成Git仓库,或者初始化一个新的空仓库.大多是其他的Git命令在初始化仓库以外是不可以使用的,所以这通常是在新项目里使用的第一个命令.


执行`git init`将在项目根目录创建一个`.git`子目录,其中包含了这个仓库所有必须的数据.撇开这一个`.git`目录,一个已存在的项目快照被保留下来了(不同于SVN,Git不需要每一个子目录中都含有`.git`目录).

#### 使用
```sh
git init
```

将当前目录改为一个Git仓库,这将在当前目录新建一个`.git`目录,并且使之开始记录这一项目的版本更新信息.

```sh
git init <directory>
```

在指定的目录中创建一个空的Git仓库,执行这个一个命令将会创意个新的目录,名字为`<directory>`,其中只包含了一个`.git`子目录.

```sh
git init --bare <directory>
```

初始化一个空的Git仓库,但是省略掉工作目录.共享的仓库应当通常使用`--bare`这个一标记来创建(请看以下的讨论).按照惯例,以`--bare`初始化的仓库名称以`.git`结尾.例如,裸版本的仓库名称为my-project应当以my-project.git这一名字来存储.

####讨论

同SVN相比较, `git init`命令是一个非常简单用来创建版本控制项目的方式. Git 不需要你创建一个仓库,导入文件,并且检出工作镜像. 你所需要做的仅仅是进入你的项目根目录,执行`git init`,你将会得到一个功能齐全的Git仓库.

然而对于到多书项目来说,`git init`仅仅需要执行一次来创建一个中心仓库-开发人员通常不会使用`git init`创建他们自己的本地仓库s. 取而代之的是, 他们同将使用`git clone`来复制已存在的项目到本地.

####裸仓库

使用`--bare`标记创建一个仓库将不包含工作目录,将无法在这个目录中编辑文件和提交更改.核心仓库应当以裸仓库的形式创建,因为推送分支到一个非裸仓库将有可能覆盖已有的改变.考虑使用`--bare`作为一种将仓库标记为存储设备的方式,相反则是一个开发环境.这意味着几乎所有的Git的工作流程，在中央存储库是裸仓库，本地资源库都是非裸仓库。

####示例

正因为git clone 是一更加方便创建一个项目本地克隆的方式,git init 通常情况下是创建一个中央仓库.

```sh
ssh <user>@<host>
cd path/above/repo
git init --bare my-project.git
```
首先,通过SSH链接到将要存储你的项目的服务器上,让后, 选择任意你想存储你的项目的文件夹.最后,通过`--bare`标签创建一个中心仓库.此时开发者们将可以通过clone来创建一个本地的镜像.


###git clone


`git clone`命令拷贝一个现有的Git仓库,这有点像svn的checkout,除了工作目录,将是一个完整的git仓库,当有自己的历史记录,管理自己的文件,并且同原始的仓库完全隔离.


方便起见,克隆将自动创建一个叫做origin的远程链接指向原始仓库,这使得同中心仓库交互变得更加容易.

####使用

```sh
git clone <repo>
```
克隆这一仓库到本机的`<repo>`目录. 这一原始仓库可以位于本机的文件系统中,或者是可通过HTTP或者SSH访问的远程主机中.

```sh
git clone <repo> <directory>
```

可以一个仓库到本机`<repo>`目录下的`<directory>`目录下.

讨论

如果已经在中央仓库中新建了一个项目,那么git clone 命令是用户回去开发镜像的最常使用的命令. 如同git init, cloning 通常是前置的命令—一旦开发者获得了一个工作镜像,所有的版本控制操作以及协作将由本地仓库管理.

仓库之间的协作

理解Git的工作目录有同SVN仓库中检出的工作目录之间的区别是非常重要的.不同于SVN,Git使得工作镜像和原始中心仓库之间没有任何区别,她们都是功能齐全的Git仓库.

这使得通过Git协作从根本上不同于SVN. 鉴于SVN基于中心仓库与工作镜像之间的关系, Git的协作模式是基于仓库之间的相互作用. 不同于checking一个工作镜像到中心仓库,通过从一个仓库向另外一个仓库.


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

Q: How to change orgin url?
A:
```sh
git remote remove origin
git remote add origin <url>
git branch --set-upstream-to=origin/master
```
Q: 修改 git repo 历史提交的 author ?
A:
```sh
git rebase -i HEAD~n
# change pick to edit
git commit --amend      #change commit info
git rebase --continue   #continue
git commit --amend --author "your email"    #change author
git rebase --continue   #continue
#  you will see
$ git rebase --continue
Successfully rebased and updated refs/heads/master.
```
Q: 如果只克隆指定的分支?
A:
```sh
git clone -b gh-pages --single-branch git@github.com:wsdjeg/DotFiles.git
```

Q: github 初始化一个仓库，如何和本地不相干的项目合并？
A:
```
git remote add origin ....
git branch --set-upstream-to=origin/master master
git merge origin/master --allow-unrelated-histories
```

Q: git clone 用于 vim 的job func时如何将进度输入到stdout？
A:
```
git clone --progress ...
```

类似于github

https://bitbucket.org/
https://opensource.google.com/


加速 git 体验：

修改 hosts 加入：

```
151.101.72.249 http://global-ssl.fastly.Net
192.30.253.112 http://github.com
```

执行：

```
git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global https.https://github.com.proxy https://127.0.0.1:39397
git config --global http.http://github.com.proxy http://127.0.0.1:39397
git config --global http.postBuffer 524288000
```
