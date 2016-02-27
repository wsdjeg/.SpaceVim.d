Q: how to build from source in ubuntu?
A:
```sh
sudo apt-get install libcurl4-gnutls-dev
make prefix=/usr/local all
sudo make prefix=/usr/local install
```


git sqash

git rebase -i HEAD~3

replace "pick" on the second and subsequent commits with "squash" or "fixup"

also in new version git

we also can use

git rebase -i @~3

Fix git cannot lock ref
rm .git/refs/remotes/origin/master
git fetch
