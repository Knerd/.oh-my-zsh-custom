echo "
       _____ _          __                      _        ___ 
      |_   _| |_ ___   |  |   ___ ___ ___ ___ _| |   ___|  _|
        | | |   | -_|  |  |__| -_| . | -_|   | . |  | . |  _|
        |_| |_|_|___|  |_____|___|_  |___|_|_|___|  |___|_|                                
            ███████╗███████╗██╗  ██╗███████╗██╗     ██╗     
            ╚══███╔╝██╔════╝██║  ██║██╔════╝██║     ██║     
              ███╔╝ ███████╗███████║█████╗  ██║     ██║     
             ███╔╝  ╚════██║██╔══██║██╔══╝  ██║     ██║     
            ███████╗███████║██║  ██║███████╗███████╗███████╗
            ╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
                 --- Oh-my & The Hero-of-Legend --- 
                         
                         press start ⚔z
                               🎮
"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
# Characters
SEGMENT_SEPARATOR="\ue0b0"
PLUSMINUS="\u00b1"
BRANCH="🚧"
HAMMER="🔨"
BOMB="💣"
BOW="🏹"
SEED="🌱"
DETACHED="\u27a6"
CROSS="✝"
LIGHTNING="🌩"
GEAR="⚙"
SWORDS=$'⚔'
TOOLBOX="🧰"
SWORD=$'🗡'
ADDKEY=$'🪄'
KEY=$'🗝'
DOOR=$'🚪'
DIR=$'\uf413🔺'
DIF=$'🪞'
SUN=$'☀'
MOON=$'🌙'
TIME=$'😶‍🌫'
MERGE=$'🫙'
PUSH=$'🪃'  
PULL=$'🎣'
STAT=$'🍄'
OUT=$'\ufcdf'
LIFE=$'📜'
DESK=$'🖥'
EXIT=$'💥'
MAP=$'🏰'
COMPASS=$'🧭'
CART=$'🛒'
SPARKLE=$'✨'
TRASH=$'🗑'
HISTORY=$'📗'
FIND=$'🔦'

#alias


local _prompt="$(echo -e "${NERDISH_SYMBOL_PROMPT:-"\uf105"}")"
local _directory="$(echo -e "${NERDISH_SYMBOL_DIRECTORY:-"\uf0a0"}")"
local _branch="$(echo -e "${NERDISH_SYMBOL_GIT_BRANCH:-"\ue725"}")"
local _action="$(echo -e "${NERDISH_SYMBOL_GIT_ACTION:-"\uf101"}")"
local _staged="$(echo -e "${NERFISH_SYMBOL_GIT_STAGED:-"\uf055"}")"
local _unstaged="$(echo -e "${NERDISH_SYMBOL_GIT_UNSTAGED:-"\uf059"}")"

# $fg_bold[yellow] y  $reset_color$fg[blue]☉ %D{%A} $fg[green]☪ %D{%F} $fg[yellow]⌛ %D{%I:%M:%S%P}
# $fg_bold[yellow]🔺🔺 $reset_color$fg[blue]† %m $fg[green]%n @ $fg_bold[green]%c $reset_color$(git_prompt_info)
# $fg_bold[blue]† $reset_color'

 term_prompt() {
   printf '\n\n\n'; 
 }
_l="$fg[blue][$fg[white]"
_rl="$reset_color$fg[blue]|$fg[white]"
_r="$fg_bold[blue]$reset_color$fg[blue]]$reset_color"

#  $fg[blue]$SWORD$_l$ACTIONS$_r
precmd () {

KEYS=0
if [ $(pwd) != "/" ]; then 
  KEYS=$(pwd | awk -F"/" '{print NF-1}; ')
fi

alias trash-size="du --human-readable --summarize ~/.local/share/Trash"
TRASH_SIZE=(${$(trash-size)//G/ })
TRASH_SIZE=$( printf "%.0f" $TRASH_SIZE[1] )

DOWNLOAD_DIRS=$( ls -l ~/Downloads/ | wc -l )
BOMBS="$TRASH_SIZE${BOMB}b"
ARROWS="$DOWNLOAD_DIRS${BOW}a"
KEYS="${KEYS}${KEY}k"
SEARCH="${FIND}f"
BELL="${HISTORY}h"
CLEAR="${TRASH}CL"
CLOSE="${EXIT}x"
HUD="$KEYS $BOMBS $ARROWS"


ZSH_THEME_GIT_PROMPT_PREFIX="
$TOOLBOX ${HAMMER}A ${SEED}B ${LIFE}C ${SPARKLE}CO ${DIF}D 🌀I ${MERGE}M ${PUSH}P ${PULL}p ${STAT}S 
$fg_bold[cyan]-LVL- $BRANCH $reset_color"
 
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color
"

CLOCK="-TIME- $SUN%D{%B}/%D{%d} $MOON %D{%A} $TIME%D{%I:%M:%S%P}"

NAVI='🧚 "Hey, listen!"'
RPROMPT='${SWORD}z $CLOCK $HUD ${CLOSE}'
PROMPT='$reset_color$DESK $fg[white]%m $NAVI $(git_prompt_info)
$fg_bold[yellow] ▲  $reset_color$fg[cyan]$MAP %d 
$fg_bold[yellow]▲ ▲ $reset_color$fg_bold[green]$DOOR %c $fg_bold[green]
$ $reset_color'
}


# ZSH_THEME_GIT_PROMPT_DIRTY=" $reset_color$fg[red]-LIFE- ♥ ♡ ♡  "
# ZSH_THEME_GIT_PROMPT_CLEAN=" $reset_color$fg[red]-LIFE- ♥ ♥ ♥ "
ZSH_THEME_GIT_PROMPT_DIRTY=" $reset_color$fg_bold[red]-LIFE- ❤❤💔🖤🖤🖤🖤🖤🖤🖤  "
ZSH_THEME_GIT_PROMPT_CLEAN=" $reset_color$fg_bold[red]-LIFE- ❤❤❤❤❤❤❤❤❤❤  "

#TMOUT=60

TMOUT=1
TRAPALRM() {
 zle reset-prompt
}