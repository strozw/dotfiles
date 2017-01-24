
###############################################
# anyenv (path)
###############################################
export XDG_CONFIG_HOME=~/.config

###############################################
# anyenv (path)
###############################################
export PATH="$HOME/.anyenv/bin:$PATH"
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

###############################################
# homeshick
###############################################
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)

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


