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
    if [ "$1" = "prod" ]; then
        prefix="inacanoe-prod"
    elif [ "$1" = "qa" ]; then
        prefix="inacanoe-qa"
    else
        echo "Invalid environment. Please specify 'prod' or 'qa'."
        return 1
    fi
    # Store the output of docker ps -a in a variable
    containers=($(docker ps -a | grep $prefix | awk '{print $1}'))

    # Check if containers exist before trying to stop and remove them
    if [ -n "$containers" ]; then
        docker container stop "${containers[@]}";
        docker container rm -vf "${containers[@]}";
    else
        echo "No containers matching prefix '$prefix' found";
    fi

    # Remove images matching the pattern 'inacanoe-qa-*'
    images=$(docker images | awk -v term="$prefix" '$1 ~ term"-" {print $3}')
    if [ -n "$images" ]; then
        docker image rm "${images[@]}";
    else
        echo "No images matching prefix '$prefix' found.";
    fi
}
function docker_clean2 {
    if [ "$1" = "prod" ]; then
        docker container rm $(docker container ls -a | grep -i 'inacanoe-prod-web'| awk '{print $1}'); docker image rm inacanoe-prod-web;
    elif [ "$1" = "qa" ]; then
        docker container rm $(docker container ls -a | grep -i 'inacanoe-qa-web'| awk '{print $1}'); docker image rm inacanoe-qa-web;
    else
        echo "Invalid environment. Please specify 'prod' or 'qa'."
        return 1
    fi
}
function docker_clean_old {
    docker container stop $(docker ps -a | grep "inacanoe-qa" | awk '{print $1}')
    docker container rm -vf $(docker ps -a | grep "inacanoe-qa" | awk '{print $1}')
    docker image rm inacanoe-qa-web;
    #docker image rm inacanoe-qa-db;
}
function docker_clean_prod {
    docker container stop $(docker ps -a | grep "docker_flaskapp_prod" | awk '{print $1}')
    docker container rm -vf $(docker ps -a | grep "docker_flaskapp_prod" | awk '{print $1}')
    docker image rm docker_flaskapp_prod-web;
}
