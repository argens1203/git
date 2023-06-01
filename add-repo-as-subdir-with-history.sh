TREE=$1
DIR=$TREE
GIT_PATH=git@github.com:argens1203/$2.git
BRANCH="${3:-main}"
COMMIT_MESSAGE="Merge $1 as our subdirectory"

echo "git merge -s ours --no-commit --allow-unrelated-histories $TREE/$BRANCH"

git remote add -f $TREE $GIT_PATH
git merge -s ours --no-commit --allow-unrelated-histories $TREE/$BRANCH
git read-tree --prefix=$DIR -u $TREE/$BRANCH
git commit -m "$COMMIT_MESSAGE"
git pull -s subtree $TREE $BRANCH
