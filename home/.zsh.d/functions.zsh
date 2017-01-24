# peco hitory
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history | cut -c 8- | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# peco cdr
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        cd ${selected_dir}
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
#bindkey '^@' peco-cdr

# peco z
function peco-z () {
    local selected_dir=$(z -t | sort -nr | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        #BUFFER="cd ${selected_dir}"
        cd ${selected_dir}
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-z
bindkey '^@' peco-z

# peco homesick
function peco-homesick () {
    local selected_dir=$(homesick list | awk '{ print $1 }' | peco)
    if [ -n "$selected_dir" ]; then
        homesick cd ${selected_dir}
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-homesick
bindkey '^h' peco-homesick

# process kill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

# tmux attach session
function peco-tmux-attach-session() {
	local sid=$(tmux ls | peco | awk '{ print $1 }' | cut -d':' -f1)
	tmux attach-session -t $sid
}
alias pta="peco-tmux-attach-session"

function peco-ghq () {
	cd $(ghq list -p | peco)
    #local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    #if [ -n "$selected_dir" ]; then
	#	BUFFER="cd ${selected_dir}"
	#	zle accept-line
	#fi
    #zle clear-screen
}
zle -N peco-ghq
bindkey '^]' peco-ghq
alias peco-src="peco-ghq"


