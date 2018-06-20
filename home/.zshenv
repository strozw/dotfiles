export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

###############################################
# anyenv (path)
###############################################
export XDG_CONFIG_HOME=~/.config

###############################################
# switch evn
###############################################
case ${OSTYPE} in
    darwin*)
        source ~/.zshenv.darwin
        ;;
    linux*)
        source ~/.zshenv.linux
        ;;
esac

