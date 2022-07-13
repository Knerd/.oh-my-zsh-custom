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
                         
                         press start 👕️z
                               🎮
"

# Characters
local SEGMENT_SEPARATOR="\ue0b0"
local PLUSMINUS="\u00b1"
local DETACHED="\u27a6"
local BRANCH="🚧"
local HAMMER="🔨"
local BOMB="💣"
local BOW="🏹"
local SEED="🌱"
local CROSS="✝"
local LIGHTNING="🌩"
local GEAR="⚙"
local SWORDS=$'⚔'
local TOOLBOX="🧰"
local SWORD=$'🗡️'
local ADDKEY=$'🪄'
local KEY=$'🗝️'
local DOOR=$'🚪'
local DIR=$'\uf413🔺'
local DIF=$'🪞'
local SUN=$'☀'
local MOON=$'🌙'
local TIME=$'‍⌚'
local MERGE=$'🏺'
local PUSH=$'🪃'  
local PULL=$'🎣'
local STAT=$'🍄'
local OUT=$'\ufcdf'
local LIFE=$'📜'
local DESK=$'🖥'
local EXIT=$'💥'
local MAP=$'🏰'
local COMPASS=$'🧭'
local CART=$'🛒'
local SPARKLE=$'✨'
local TRASH=$'🗑'
local HISTORY=$'📗'
local FIND=$'🔦'

QUOTES=(
  "🧚 Hey, listen!"
  "🧙‍♂️ Its dangerous to go alone. Take this!"
  "🧚 Hey, Wake up $USER!"
  "🧝‍♂️ Zsh, Its a secret to everybody."
  "👺 Grumble, Grumble"
  "🦸‍♂️ Well excuse me, princess!"
  "🕺 I am Error"
  "🐲 Dodongo Dislikes Smoke"
)

local _prompt="$(echo -e "${NERDISH_SYMBOL_PROMPT:-"\uf105"}")"
local _directory="$(echo -e "${NERDISH_SYMBOL_DIRECTORY:-"\uf0a0"}")"
local _branch="$(echo -e "${NERDISH_SYMBOL_GIT_BRANCH:-"\ue725"}")"
local _action="$(echo -e "${NERDISH_SYMBOL_GIT_ACTION:-"\uf101"}")"
local _staged="$(echo -e "${NERFISH_SYMBOL_GIT_STAGED:-"\uf055"}")"
local _unstaged="$(echo -e "${NERDISH_SYMBOL_GIT_UNSTAGED:-"\uf059"}")"
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"

_l="$fg[blue][$fg[white]"
_rl="$reset_color$fg[blue]|$fg[white]"
_r="$fg_bold[blue]$reset_color$fg[blue]]$reset_color"


CASTLE="$reset_color$fg[cyan]$MAP %d"
FLOOR="$reset_color$fg_bold[green]$DOOR %c"

declare -A MAGIC 
MAGIC[lantern]=""
MAGIC[exit]="${EXIT}x"
MAGIC[hammer]="${HAMMER}A"
MAGIC[bean]="${SEED}B"
MAGIC[scroll]="${LIFE}C"
MAGIC[powder]="${SPARKLE}CO"
MAGIC[mirror]="${DIF}D"
MAGIC[flow]="🌀I"
MAGIC[bottle]="${MERGE}M"
MAGIC[boomerang]="${PUSH} P"
MAGIC[poll]="${PULL}p"
MAGIC[mushroom]="${STAT}S"
MAGIC[branch]="$fg_bold[cyan]-LVL- $BRANCH"

# ITEM SHORTCUTS
SEARCH="${FIND}f"
BELL="${HISTORY}h"
CLEAR="${TRASH}CL"
CLOSE=$MAGIC[exit]

# GIT PROMPTS
GIT_HUD=(
  "\n"
  $TOOLBOX 
  $MAGIC[hammer]
  $MAGIC[bean]
  $MAGIC[scroll]
  $MAGIC[powder]
  $MAGIC[mirror]
  $MAGIC[flow]
  $MAGIC[bottle]
  $MAGIC[bommerang]
  $MAGIC[poll]
  $MAGIC[mushroom]
  "\n"
  $MAGIC[branch]
  "$reset_color$fg_bold[white]"
)

LIFE=(
  " $fg_bold[red]-LIFE- 💛💛💛💛💛💛💛💛💛💛  "
  " $fg_bold[red]-LIFE- ️️💜💜💜🖤🖤🖤🖤🖤🖤🖤  "
)

# THE TRIFORCE
TRIFORCE=(
  "$fg_bold[yellow] ▲ " 
  "$fg_bold[yellow]▲ ▲"
)

TRIFORCE_LOWRULE=(
  "$fg_bold[yellow]⯆ ▼" 
  "$fg_bold[yellow] ⯆ "
)

TRIFORCES=(
  HYRULE
  LOWRULE
)

precmd () {
  # HUDS
  NAVI=${QUOTES[ $RANDOM % ${#QUOTES[@]} ]}
  INFO=(
    "$DESK $fg[white]%m"
    $NAVI 
  )

  # BOMBS
  alias trash-size="du --human-readable --summarize -csh --block-size=1G ~/.local/share/Trash"
  TRASH_SIZE=(${$(trash-size)//G/ })
  TRASH_SIZE=$( printf "%.0f" $TRASH_SIZE[1] )

  # ARROWS 
  DOWNLOAD_DIRS=$( ls -l ~/Downloads/ | wc -l )

  # KEYS
  KEYS=0
  if [ $(pwd) != "/" ]; then 
    # COUNT HOW MANY DIRECTORIES DEEP WE ARE
    KEYS=$(pwd | awk -F"/" '{print NF-1}; ')
  fi

  # ITEMS
  ARROWS="$DOWNLOAD_DIRS${BOW}a"
  BOMBS="$TRASH_SIZE${BOMB}b"
  KEYS="${KEYS}${KEY} k"

  # CLOCK
  CLOCK=(
    -TIME-
    $SUN%D{%B}/%D{%d}
    $MOON %D{%A}
    $TIME%D{%I:%M:%S%P}
  )

  HUD=(
    $SWORD z
    "$CLOCK[@]"
    $KEYS 
    $BOMBS 
    $ARROWS
    $CLOSE
  )

  # GIT PROMPTS
  ZSH_THEME_GIT_PROMPT_PREFIX=$GIT_HUD[@]
  ZSH_THEME_GIT_PROMPT_CLEAN=$LIFE[1]
  ZSH_THEME_GIT_PROMPT_DIRTY=$LIFE[2]
  ZSH_THEME_GIT_PROMPT_SUFFIX=$reset_color

  # HERO OF LEGEND TERMINAL PROMPT
  RPROMPT="$HUD[@]"

  PROMPT="$INFO[@] $(git_prompt_info)
  $TRIFORCE[1] $CASTLE 
  $TRIFORCE[2] $FLOOR
  $ $reset_color"
}

# CLOCK COUNTER
TMOUT=1

TRAPALRM() {
  zle reset-prompt
}