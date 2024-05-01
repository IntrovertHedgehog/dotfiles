# If you come from bash you might have to change your $PATH.
export PATH=$PATH:/usr/local/texlive/2023/bin/x86_64-linux
export PATH=$PATH:/opt/pulsesecure/bin
# export PATH=$PATH:/opt/cuda/bin

# CUDA
# export LD_LIBRARY_PATH=/opt/cuda/lib64:/opt/TensorRT-8.6.1.6/lib:${LD_LIBRARY_PATH}

# java
# export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
export JAVA_HOME=/usr/lib/jvm/default-runtime
# docker rootless
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
# for nvm
export NVM_DIR=~/.nvm
 [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# android, react native
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# aliases
alias setws="xrandr --output HDMI-1 --mode 1920x1080 --right-of eDP-1 && adjbr && polybar -r onedark-sec & disown"
alias clp="xclip -selection clipboard"
alias sony="bluetoothctl connect 74:45:CE:CD:54:14"
alias disony="bluetoothctl disconnect 74:45:CE:CD:54:14"
alias lablestudio="docker run -it -p 8080:8080 -v ~/.local/share/label-studio/data heartexlabs/label-studio:latest"
alias vpn="sudo openfortivpn webvpn.comp.nus.edu.sg --username=e0550397"
alias caps="systemctl start mariadb && systemctl --user start docker && systemctl start nginx & docker run -p 800 0:8000 chromadb/chroma & disown"
alias config="git --git-dir=$HOME/.cfg --work-tree=$HOME"

# get ip v4 and v6
function gip {
  echo $(curl ifconfig.me --no-progress-meter);
  echo $(curl ipinfo.io/ip --no-progress-meter);
}

function adjbr {
  local inp=${1=0.1}
  local bri=$((1 - $inp))
  xrandr --output eDP-1 --brightness ${bri} & xrandr --output HDMI-1 --brightness $((bri - 0.1))
}

# quick directory cd-ing
setopt cdablevars
export dsci=$HOME/documents/study/data\ science/
export dcom=$HOME/documents/study/computing/
export decon=$HOME/documents/study/economics/
export dmath=$HOME/documents/study/math/
export anus=$HOME/apps/works/nus/
export fyp=$HOME/apps/study/fyp/
export capstone=$HOME/apps/study/pilot_for_pilot/


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="awesomepanda"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    colored-man-pages
    )

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export INFOPATH="/usr/local/info:$INFOPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
setopt correct
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/snap/bin:$PATH

alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/opt/google/google-cloud-sdk/path.zsh.inc' ]; then . '/opt/google/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/opt/google/google-cloud-sdk/completion.zsh.inc' ]; then . '/opt/google/google-cloud-sdk/completion.zsh.inc'; fi
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
