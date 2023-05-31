set TREE_NAME=any-string
set GIT_PATH=git@githost.com:user/repo.git
set BRANCH=main
set COMMIT_MESSAGE='Merge any-string as our subdirectory'

git remote add -f $TREE $GIT_PATH
get merge -s ours --no-commit --allow-unrelated-histores $TREE/$BRANCH
git read-tree --prefix=$DIR -u $TREE/$BRANCH
git commit -m "$COMMIT_MESSAGE"
git pull -s subtree $TREE $BRANCH
