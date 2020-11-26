#!/bin/zsh

# Used for hotfixing main branch. Adds and commits changes to main branch, pushes them, tags them and pushes tags and merges to develop and pushes it up
if [ $1 ] && [ $2 ]
then
    git add . && git commit -m "$1" && git push && git tag -a "$2" -m "${3:-$2}" && git push origin "$2" && git checkout develop && git pull && git merge master --no-edit && git push
else
    echo "\e[33m\e[1mUSAGE\e[0m: \e[32mupdate-data <COMMIT_MESSAGE> <TAG> <TAG_MESSAGE>"
    echo "\e[33m\e[1mNOTE\e[0m: If tag message is not supplied commit message is used instead"
    exit 1
fi
