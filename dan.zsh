################# PREZTO CONFIGURATION #################

zstyle ':prezto:*:*' color 'yes'

zstyle ':prezto:load' pmodule   \
    'environment'               \
    'terminal'                  \
    'editor'                    \
    'history'                   \
    'directory'                 \
    'utility'                   \
    'completion'                \
    'syntax-highlighting'       \
    'history-substring-search'


zstyle ':prezto:module:editor' key-bindings 'emacs'



################# PREZTO LAUNCH #################


ZPREZTODIR="${0:a:h}/prezto"

if [[ ! -d "$ZPREZTODIR" ]]
then
    echo Cloning Prezto
    git clone -q --recursive "https://github.com/sorin-ionescu/prezto.git" "$ZPREZTODIR"
fi	

#ZDOTDIR="$HOME/.antigen" # because antigen tries to put files into its directory, and prezto into $ZDOTDIR
source "$ZPREZTODIR/runcoms/zprofile"
source "$ZPREZTODIR/init.zsh"
source "$ZPREZTODIR/runcoms/zlogin"
#HISTFILE="$HOME/.history" # we redefined ZDOTDIR but want history to be in the home dir

################# PREZTO OVERRIDE #################

unsetopt COMPLETE_IN_WORD

################# MY PROMPT #################



function precmd()
{
    if [[ -w . ]]
    then
        DIR_WRITABLE='%F{159}'
    else
        DIR_WRITABLE='%F{169}'
    fi
}

ARROW_RIGHT=$'\uE0B0'
BG=237

PROMPT='%K{$BG}%(?..%F{196}✘ %f)%(!.%F{214}.%F{107})%n@%m%f ${DIR_WRITABLE}%~ %k%F{$BG}$ARROW_RIGHT%f '
setopt prompt_subst



autoload -U zmv
alias mmv='noglob zmv -W'
