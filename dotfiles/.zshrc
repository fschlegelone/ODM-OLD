# if which pyenv-virtualenv-init >/dev/null; then eval "$(pyenv virtualenv-init -)"; fi
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# gnu getopt
# PATH="/opt/homebrew/opt/gnu-getopt/bin:$PATH"

# --| FUNCTIONS --| #
# print path
function ppath() {
  echo "Path Variable:"
  echo "$PATH" | tr ':' '\n'
}

# print chinfo
function chinfo() {
  echo "$(stat -f '%U:%G' $1)"
}

# -------------------- #
# NODE VERSION MANAGER #
# -------------------- #

# load-nvmrc() {
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # load nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # load nvm bash completion
#   autoload -U add-zsh-hook
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"
#
#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
#
#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc

# ----- #
# ZIMRC #
# ----- #
# ZIM_HOME=$HOME/.zim
# # Download zimfw plugin manager if missing.
# if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
#   curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
#     https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
# fi
# # Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
# if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
#   source ${ZIM_HOME}/zimfw.zsh init -q
# fi
# # Initialize modules.
# source ${ZIM_HOME}/init.zsh

# PNPM #
# ---- #
export PNPM_HOME="$HOME/Library/pnpm" # set PNPM_HOME
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac

# STARSHIP #
# -------- #
eval "$(starship init zsh)"

# VISUAL STUDIO CODE #
# ------------------ #
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# ---------------- #
# GNU UTIL ALIASES #
# ---------------- #
# gnutls package

alias chroot="gchroot"
alias dirname="gdirname"
alias head="ghead"
alias mkdir="gmkdir"
alias paste="gpaste"
alias rmdir="grmdir"
alias sort="gsort"
alias timeout="gtimeout"
alias uptime="guptime"
alias b2sum="gb2sum"
alias cksum="gcksum"
alias du="gdu"
alias hostid="ghostid"
alias mkfifo="gmkfifo"
alias pathchk="gpathchk"
alias runcon="gruncon"
alias split="gsplit"
alias touch="gtouch"
alias users="gusers"
alias base32="gbase32"
alias comm="gcomm"
alias echo="gecho"
alias id="gid"
alias mknod="gmknod"
alias pinky="gpinky"
alias seq="gseq"
alias stat="gstat"
alias tr="gtr"
alias vdir="gvdir"
alias base64="gbase64"
alias cp="gcp"
alias env="genv"
alias install="ginstall"
alias mktemp="gmktemp"
alias pr="gpr"
alias sha1sum="gsha1sum"
alias stdbuf="gstdbuf"
alias true="gtrue"
alias wc="gwc"
alias basename="gbasename"
alias csplit="gcsplit"
alias expand="gexpand"
alias join="gjoin"
alias mv="gmv"
alias printenv="gprintenv"
alias sha224sum="gsha224sum"
alias stty="gstty"
alias truncate="gtruncate"
alias who="gwho"
alias basenc="gbasenc"
alias cut="gcut"
alias expr="gexpr"
alias kill="gkill"
alias nice="gnice"
alias printf="gprintf"
alias sha256sum="gsha256sum"
alias sum="gsum"
alias tsort="gtsort"
alias whoami="gwhoami"
alias cat="gcat"
alias date="gdate"
alias factor="gfactor"
alias link="glink"
alias nl="gnl"
alias ptx="gptx"
alias sha384sum="gsha384sum"
alias sync="gsync"
alias tty="gtty"
alias yes="gyes"
alias chcon="gchcon"
alias dd="gdd"
alias false="gfalse"
alias ln="gln"
alias nohup="gnohup"
alias pwd="gpwd"
alias sha512sum="gsha512sum"
alias tac="gtac"
alias uname="guname"
alias chgrp="gchgrp"
alias df="gdf"
alias fmt="gfmt"
alias logname="glogname"
alias nproc="gnproc"
alias readlink="greadlink"
alias shred="gshred"
alias tail="gtail"
alias unexpand="gunexpand"
alias chmod="gchmod"
alias dir="gdir"
alias fold="gfold"
alias ls="gls"
alias numfmt="gnumfmt"
alias realpath="grealpath"
alias shuf="gshuf"
alias tee="gtee"
alias uniq="guniq"
alias chown="gchown"
alias dircolors="gdircolors"
alias groups="ggroups"
alias md5sum="gmd5sum"
alias od="god"
alias rm="grm"
alias sleep="gsleep"
alias test="gtest"
alias unlink="gunlink"
alias tar="gtar"       # gnu-tar package
alias sed="gsed"       # gnu-sed package
alias indent="gindent" # gnu-indent package
alias which="gwhich"   # gnu-which package

# --------
# directory aliases
# --------
alias cdrepos='cd /opt/repos'

# --------
# command aliases
# --------
# alias lg="lazygit"
# alias g="git"
# alias py="python"
# alias gr="rg"
# alias vi="nvim"
# alias f="fastfetch"
# alias br="brew"
# alias cl="clear"
# alias md="mkdir"
# alias mf="touch"
# alias pm="podman"
# alias bashlypod='podman run --rm -it --user $(id -u):$(id -g) --volume "$PWD:/app" dannyben/bashly'

# pnpm aliases
alias p="pnpm"
alias pi="pnpm add"
alias px="pnpx"

# advanced aliases
# alias chi="stat -f '%A:%Su:%Sg'"
# alias chm="chmod"
# alias cho="chown"
