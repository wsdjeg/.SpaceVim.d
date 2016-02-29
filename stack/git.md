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
