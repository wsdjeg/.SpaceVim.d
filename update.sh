a=$1
git add .
if a=""
then
    git commit -m "new"
else
    git commit -m $a
fi

git push
