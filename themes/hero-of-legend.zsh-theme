# Introduce Characters
declare -A NPC=(
 [wizard]=🧙
 [fairy]=🧚️
 [elf]=🧝
 [dragon]=🐲
 [hero]=🦸
 [genie]=🧞‍♂️
 [villian]=🧞
)

# INTRODUCE HERO OF LEGEND ICONS
declare -A HERO=(
 [bean]=🌱 
 [bomb]=💣 
 [book]=📗 
 [boomerang]=🪃 
 [bow]=🏹 
 [branch]=🚧 
 [cart]=🛒 
 [castle]=🏰 
 [compass]=🧭 
 [controller]=🎮 
 [door]=🚪 
 [exit]=💥 
 [flashlight]=🔦 
 [hammer]=🔨 
 [bottle]=🏺 
 [key]=️️🗝️
 [mirror]=🔍 
 [moon]=🌙 
 [mushroom]=🍄 
 [poll]=🎣 
 [scroll]=📜 
 [powder]=✨ 
 [sun]=🌞 
 [sword]=️🗡️ 
 [swords]=⚜️ 
 [toolbox]=🧰 
 [trash]=🗑 
 [watch]=⌚ 
)

# MAP ICONS TO THE MAGIC BUTTONS
declare -A MAGIC=(
  [bow]="${HERO[bow]}a"
  [bomb]="${HERO[bomb]}b"
  [key]="${HERO[key]} k"
  [bean]="${HERO[bean]}B"
  [boomerang]="${HERO[boomerang]} P"
  [bottle]="${HERO[bottle]}M"
  [branch]="$fg_bold[cyan]-LVL- ${HERO[branch]}"
  [exit]="${HERO[exit]}x"
  [flow]="🌀I"
  [hammer]="${HERO[hammer]}A"
  [lantern]="${HERO[lantern]}f"
  [mirror]="${HERO[mirror]}D"
  [mushroom]="${HERO[mushroom]}S"
  [poll]="${HERO[poll]}p"
  [powder]="${HERO[powder]}CO"
  [scroll]="${HERO[scroll]}C"
  [sword]="${HERO[sword]} z"
)

local ADDKEY=$'🪄'
local BOMB="💣"
local BOW="🏹"
local BRANCH="🚧"
local CART=$'🛒'
local COMPASS=$'🧭'
local CROSS="✝"
local DESK=$'🎮'
local DETACHED="\u27a6"
local DIF=$'🪞'
local DIR=$'\uf413🔺'
local DOOR=$'🚪'
local EXIT=$'💥'
local FIND=$'🔦'
local GEAR="⚙"
local HAMMER="🔨"
local HISTORY=$'📗'
local KEY=$'🗝️'
local LIFE=$'📜'
local LIGHTNING="🌩"
local MAP=$'🏰'
local MERGE=$'🏺'
local MOON=$'🌙'
local OUT=$'\ufcdf'
local PLUSMINUS="\u00b1"
local PULL=$'🎣'
local PUSH=$'🪃'  
local SEED="🌱"
local SEGMENT_SEPARATOR="\ue0b0"
local SPARKLE=$'✨'
local STAT=$'🍄'
local SUN=$'☀'
local SWORD=$'🗡️'
local SWORDS=$'⚔'
local TIME=$'‍⌚'
local TOOLBOX="🧰"
local TRASH=$'🗑'

QUOTES=(
  "${NPC[fairy]} Hey, listen!"
  "${NPC[wizard]}️ Its dangerous to go alone. Take this!"
  "${NPC[fairy]} Hey, Wake up $USER!"
  "${NPC[elf]} Zshhhhh, Its a secret to everybody."
  "👺 Grumble, Grumble"
  "${NPC[hero]}️ Well excuse me, princess!"
  "${NPC[man]}️  I am Error"
  "${NPC[dragon]}️ 🐲 Dodongo Dislikes Smoke"
)

# ITEM SHORTCUTS
# SEARCH=$MAGIC[lantern]
# BELL="${HISTORY}h"
# CLEAR="${TRASH}CL"
# CLOSE=$MAGIC[exit]

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

CASTLE="$reset_color$fg[cyan]$MAP %d"
FLOOR="$reset_color$fg_bold[green]$DOOR %c"

precmd () {
  # BOMBS
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
  KEYS="${KEYS}${MAGIC[key]} "
  BOMBS="$TRASH_SIZE${MAGIC[bomb]} "
  ARROWS="$DOWNLOAD_DIRS${MAGIC[bow]} "

  # CLOCK
  CLOCK=(
    -TIME-
    $SUN%D{%b}/%D{%d}
    $MOON %D{%a}
    # $TIME%D{%I:%M:%S%P}
    $TIME%D{%I:%M%P}
  )

  # HUDS
  NAVI=${QUOTES[ $RANDOM % ${#QUOTES[@]} ]}

  INFO=(
    "$DESK $fg[white]%m"
    "$CLOCK[@]"
  )

  HUD=(
    '$NAVI -'
    $KEYS 
    $ARROWS
    $BOMBS 
    $MAGIC[sword]
    $MAGIC[exit]
  )

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

  ZSH_THEME_GIT_PROMPT_PREFIX=$GIT_HUD[@]
  ZSH_THEME_GIT_PROMPT_CLEAN=$LIFE[1]
  ZSH_THEME_GIT_PROMPT_DIRTY=$LIFE[2]
  ZSH_THEME_GIT_PROMPT_SUFFIX=$reset_color

  # HERO OF LEGEND TERMINAL PROMPT
  Z="$fg_bold[green]$ $reset_color"
  RPROMPT="$HUD[@]"
  PROMPT="$INFO[@] $(git_prompt_info)
  $TRIFORCE[1] $FLOOR
  $TRIFORCE[2] $CASTLE 
  $Z"
}

# CLOCK COUNTER
# TODO: Fix tmux issue with reset-prompt removing lines after update when in
TMOUT=20
TRAPALRM() {
  zle reset-prompt
}

if [ $HEY_LISTEN ]; then
  echo "${NPC[fairy]} $HEY_LISTEN"
  export HEY_LISTEN=""
else
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
fi
