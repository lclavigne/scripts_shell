#!/bin/bash
#
#Script que clona todos os meus repositórios no Github

#Dependências
#curl, awk, sed, git


#

if [ $# -eq 0 ]; then
echo "digite o usuário"
fi

case $1 in
list)
curl -s https://api.github.com/users/$2/repos | awk '/clone_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g';;
all)
repos=$(curl -s https://api.github.com/users/$2/repos | awk '/clone_url/{print $2}' | sed 's/^"//g' | sed 's/",$//g')
cd && cd repos && mkdir $2 && cd $2
for repo in $repos
do
  git clone $repo
done;;
esac
