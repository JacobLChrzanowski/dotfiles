#/bin/sh
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo This file is $0

#alias nlist="echo $SCRIPT_DIR"
alias nlist="cat ~/.rc_files/nginx_shortcuts.sh"
alias nrel="sudo cp ~/nginx/nginx.conf /etc/nginx/nginx.conf; sudo nginx -s reload;"
alias nina="sudo cp -r ~/nginx/inacanoe.com /var/www/html/"
alias nula="sudo cp -r ~/nginx/ularutkowska.pl /var/www/html/"
alias sane_rsync="sudo rsync -rdv --update --delete $@"
alias nimg="sudo sane_rsync ~/nginx/images /var/www/; sudo sane_rsync ~/nginx/files /var/www/;"
alias nimg2="sudo cp -r ~/nginx/images /var/www/"

#alias docker_clean="docker container rm $(docker container ls -a | grep docker_flaskapp | grep -v prod | awk '{print $1}'); docker image rm docker_flaskapp-web"
#alias docker_clean_prod="docker container rm $(docker container ls -a | grep docker_flaskapp_prod | awk '{print $1}'); docker image rm docker_flaskapp_prod-web"
function docker_clean {
    docker container stop $(docker ps -a | grep "docker_flaskapp" | awk '{print $1}')
    docker container rm -vf $(docker ps -a | grep "docker_flaskapp" | awk '{print $1}')
    docker image rm docker_flaskapp-web;
}
function docker_clean_prod {
    docker container stop $(docker ps -a | grep "docker_flaskapp_prod" | awk '{print $1}')
    docker container rm -vf $(docker ps -a | grep "docker_flaskapp_prod" | awk '{print $1}')
    docker image rm docker_flaskapp_prod-web;
}
