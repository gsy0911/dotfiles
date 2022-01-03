function check_exists_then_install(){
    if type $1 > /dev/null 2>&1; then
        echo "$1 already exists"
    else
        echo "$1 not exist"
        brew install $1
    fi
}

# basics
check_exists_then_install bat
check_exists_then_install exa
check_exists_then_install gawk
check_exists_then_install jq
check_exists_then_install peco
check_exists_then_install starship
check_exists_then_install colordiff
check_exists_then_install tokei
# rust
check_exists_then_install rustup
check_exists_then_install rust-analyzer
# aws
check_exists_then_install aws-cdk
check_exists_then_install awscli
# node
check_exists_then_install node@16
# python
check_exists_then_install poetry
## for scipy
check_exists_then_install lapack
## for matplotlib
check_exists_then_install libjpeg
## for psycopg2
check_exists_then_install postgres
## for numpy, see: https://github.com/numpy/numpy/issues/17807
check_exists_then_install openblas

