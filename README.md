# Dan Zsh config using Prezto 

- Create file `~/.zshrc`

- Copy there:
```
DAN_CONFIG_DIR="$HOME/.zdan"
if [[ ! -d "$DAN_CONFIG_DIR" ]]
then
    git clone "https://github.com/danilcha/zsh-config.git" "$DAN_CONFIG_DIR"
fi
source "$DAN_CONFIG_DIR/dan.zsh"
```
