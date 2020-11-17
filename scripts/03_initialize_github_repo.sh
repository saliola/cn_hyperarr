#!/bin/bash
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }

echo "Initializing the GitHub repository and pushing changes. You may be asked your GitHub password again..."
git init >> install.log
git add . >> install.log
git commit -m "Initial commit" >> install.log
git remote add origin https://github.com/sophiasage/cn_hyperarr.git >> install.log
git push -u origin master >> install.log
echo "Initialization done."
echo "Create a branch to hold the automatically generated documentation. You may be asked your GitHub password again..."
echo "Rembember to use instead the Personal Access Token!"
echo "( See here how to get one:"
echo "  https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line )"

git clone --single-branch --depth 1 https://github.com/sophiasage/cn_hyperarr.git gh-pages >> install.log
cd gh-pages
git checkout --orphan gh-pages >> install.log
git rm -rf . >> install.log
touch .nojekyll
git add .nojekyll
git commit -m "Initial commit" >> install.log
git push -u origin gh-pages >> install.log
cd ..
echo "Done with branch creation"
