################# PREZTO CONFIGURATION #################

zstyle ':prezto:*:*' color 'yes'

zstyle ':prezto:load' pmodule   \
    'environment'               \
    'terminal'                  \
    'editor'                    \
    'history'                   \
    'directory'                 \
    'utility'                   \
    'osx'                       \
    'completion'                \
    'syntax-highlighting'       \
    'history-substring-search'


zstyle ':prezto:module:editor' key-bindings 'emacs'

# Auto convert .... to ../..
zstyle ':prezto:module:editor' dot-expansion 'yes'


# By default, only the main highlighter is enabled.
zstyle ':prezto:module:syntax-highlighting' highlighters \
   'main' \
   'brackets' \
   'pattern' \
#   'line' \
#   'cursor' \
#   'root'

# Set syntax highlighting styles.
#zstyle ':prezto:module:syntax-highlighting' styles \
#  'builtin' 'bg=blue' \
#  'command' 'bg=blue' \
#  'function' 'bg=blue'

# Set syntax pattern styles.
zstyle ':prezto:module:syntax-highlighting' pattern \
  'rm*-[rR]f*' 'fg=white,bg=red,bold'


# Auto set the tab and window titles.
zstyle ':prezto:module:terminal' auto-title 'yes'


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
PROMPT='%K{$BG}%(?..%F{196}✘ %f)%(!.%F{214}.%F{107})%n@%m%f ${DIR_WRITABLE}%~ %F{248}%(!.#.$)%k%f ' # 
setopt prompt_subst



autoload -U zmv
alias mmv='noglob zmv -W'



# Prezto bug -- substring search binding work on Mac but not on Linux, a workaround untill they fir it
for keymap in 'emacs' 'viins'; do
    bindkey -M "$keymap" "$key_info[Up]" history-substring-search-up
    bindkey -M "$keymap" "$key_info[Down]" history-substring-search-down
done
