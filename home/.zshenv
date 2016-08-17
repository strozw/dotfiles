case ${OSTYPE} in
    darwin*)
        source ~/.zshenv.darwin
        ;;
    linux*)
        source ~/.zshenv.linux
        ;;
esac

###############################################
# anyenv (path)
###############################################
export PATH="$HOME/.anyenv/bin:$PATH"

