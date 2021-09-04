function check_exists_then_install(){
    if type $1 > /dev/null 2>&1; then
        echo "$1 already exists"
    else
        echo "$1 not exist"
        brew install $1
    fi
}

check_exists_then_install bat
check_exists_then_install exa
check_exists_then_install gawk
check_exists_then_install jq
check_exists_then_install peco
check_exists_then_install starship
check_exists_then_install colordiff
