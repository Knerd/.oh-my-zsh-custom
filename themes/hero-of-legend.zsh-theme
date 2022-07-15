<< ///////////////////////////////////////////////////////////////////
  SETTINGS
///////////////////////////////////////////////////////////////////

_l="$fg[blue][$fg[white]"
_rl="$reset_color$fg[blue]|$fg[white]"
_r="$fg_bold[blue]$reset_color$fg[blue]]$reset_color"

# INTRODUCE AREA 
declare -A AREA=(
  [branch]=🚧     
  [castle]=🏰  
  [cart]=🛒       
  [shop]=🏪
  [door]=🚪 
  [dungeon]=️💀
  [controller]=🎮 
  [moon]=🌙 
  [sun]=🌞 
)

# INTRODUCE HERO - LEGEND OF ICONS
declare -A HERO=(
  [bean]=🌱       # Magic Bean 
  [bomb]=💣       # Magic Bomb 
  [book]=📗       # Magic Book
  [boomerang]=🪃  # Magic Boomerang
  [boots]=🥾      # Magic Boots
  [bottle]=🏺     # Magic Bottle
  [bow]=🏹        # Magic Bow
  [compass]=🧭    # Compass
  [exit]=💥 
  [flashlight]=🔦 # Magic Lantern
  [hammer]=🔨     # Magic Hammer
  [key]=️️🗝️        # Magic Key
  [mirror]=🔍     # Magic Mirror
  [mushroom]=🍄   # Magic Mushroom
  [poll]=🎣       # Magic Fishing Poll
  [powder]=✨     # Magic Powder 
  [scroll]=📜     # Magic Scroll
  [sword]=️🗡️      # Magic Sword
  [swords]=⚜️      # 
  [toolbox]=🧰    # Toolbox
  [trash]=🗑       # Trash
  [watch]=⌚      # Watch
)

# MAGIC BUTTONS
declare -A BUTTONS=(
  [bean]="B"
  [bomb]="b"
  [boomerang]=" P"
  [boots]="?"
  [bottle]="M"
  [bow]="a"
  [exit]="x"
  [hammer]="A"
  [key]=" k"
  [lantern]="f"
  [mirror]="D"
  [mushroom]="S"
  [poll]="p"
  [powder]="CO"
  [scroll]="C"
  [sword]=" z"
)

declare -A MAGIC
for index in "${(k)BUTTONS[@]}"; do
    MAGIC[$index]="${HERO[$index]}${BUTTONS[$index]}"
done

# Introduce Characters
declare -A NPC=(
  [dragon]=🐲
  [elf]=🧝
  [fairy]=🧚️
  [genie]=🧞‍♂️
  [hero]=🦸
  [king]=🤴
  [queen]=👸
  [villian]=🦹
  [wizard]=🧙
)

declare QUOTES=(
  "👺 Grumble, Grumble"
  "${NPC[elf]} Zshhhhh, Its a secret to everybody."
  "${NPC[fairy]} Hey, listen!"
  "${NPC[king]}️ Well excuse me, princess!"
  "${NPC[wizard]}️ Its dangerous to go alone. Take this!"
  # "${NPC[man]}️  I am Error"
  # "${NPC[dragon]}️ Dodongo Dislikes Smoke"
  # "${NPC[fairy]} Hey, Wake up $USER!"
)

# HUDS
declare -A LIFE=(
  [clean]=" $fg_bold[red]-LIFE- ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥%{$reset_color%}"
  [dirty]=" $fg_bold[red]-LIFE- ♥ ♥ \ufbdc ♡ ♡ ♡ ♡ ♡ ♡ ♡%{$reset_color%}"
)

HUD=(
  $MAGIC[bow]
  $MAGIC[bomb]
  $MAGIC[key]
  $MAGIC[sword]
  $MAGIC[boots]
  $MAGIC[exit]
)

# GIT PROMPTS
GIT_HUD=(
  $HERO[dungeon]
  $MAGIC[hammer]
  $MAGIC[bean]
  $MAGIC[scroll]
  $MAGIC[powder]
  $MAGIC[mirror]
  $MAGIC[flow]
  $MAGIC[bottle]
  $MAGIC[boomerang]
  $MAGIC[poll]
  $MAGIC[mushroom]
)

ZSH_THEME_GIT_PROMPT_PREFIX="\n%{$fg_bold[cyan]%}-LVL- ${AREA[branch]}%{$fg_bold[white]%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=$LIFE[clean]
ZSH_THEME_GIT_PROMPT_DIRTY=$LIFE[dirty]

# THE TRIFORCE
TRIFORCE=(
  " %{$fg_bold[yellow]%} ▲ " 
  " %{$fg_bold[yellow]%}▲ ▲"
)

TRIFORCE_LOWRULE=(
  " $fg_bold[yellow]⯆ ▼" 
  " $fg_bold[yellow] ⯆ "
)

TRIFORCES=(
  HYRULE
  LOWRULE
)

# CLOCK
CLOCK=(
  "%{$fg[yellow]%}-TIME-"
  ${AREA[sun]}%D{%b}/%{$fg[cyan]%}%D{%d}
  ${AREA[moon]}%D{%a}%{$reset_color%}
  "%{$fg[white]%}$HERO[watch]%D{%I:%M:%S%P}"
)

# CLOCK COUNTER
TMOUT=1

INFO=(
  "${AREA[controller]} %{$fg[white]%}%m"
  "$CLOCK[@]"
)

<< ///////////////////////////////////////////////////////////////////
  METHODS/FUNCTIONS 
///////////////////////////////////////////////////////////////////

TRAPALRM() {
  zle reset-prompt
}

doubleDigits(){
  NUM=$1
  if [ $NUM -gt 99 ] ; then
    NUM=99 
  fi
  return $NUM
}

countItems(){
  # ARROWS 
  DOWNLOAD_DIRS=$( ls -l ~/Downloads/ | wc -l )

  # BOMBS
  TRASH_SIZE=(${$(trash-size)//G/ })
  TRASH_SIZE=$( printf "%.0f" $TRASH_SIZE[1] )

  # KEYS
  KEYS=0
  if [ $(pwd) != "/" ]; then 
    # COUNT HOW MANY DIRECTORIES DEEP WE ARE
    KEYS=$(pwd | awk -F"/" '{print NF-1}; ')
  fi

  # ITEMS
  doubleDigits $DOWNLOAD_DIRS
  ARROWS=$(printf '%02d' $?)

  doubleDigits $TRASH_SIZE
  BOMBS=$(printf '%02d' $?)

  doubleDigits $KEYS
  KEYS=$(printf '%02d' $?)

  zHUD=(
    "ˣ$ARROWS"
    "ˣ$BOMBS"
    "ˣ$KEYS"
    ""
  )
}

# TODO: Refactor this...
displayHUD(){
  ITEM_HUD=""
  if [ "$(git_prompt_info)" ]; then
    if [ "$HERO_HIDE_ITEMS" = "1" ]; then
      ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
      zHUD=()
    else
      ZSH_THEME_GIT_PROMPT_SUFFIX="\n%{$HUD[@]%} %{$GIT_HUD[@]%}"
    fi
    ITEM_HUD="$(git_prompt_info)" 
  else
    if [ "$HERO_HIDE_ITEMS" = "1" ]; then
      ITEM_HUD=""
      zHUD=()
    else
      ITEM_HUD=$(echo -e "\n%{$reset_color%}%{$HUD[@]%}")
    fi
  fi
}

# HERO OF LEGEND TERMINAL PROMPT
setupLegendaryPrompt(){
  NAVI=${QUOTES[ $RANDOM % ${#QUOTES[@]} ]}
  FLOOR="${AREA[door]} %{$reset_color%}%{$fg_bold[green]%}%c"
  CASTLE="${AREA[castle]} %{$reset_color%}%{$fg[cyan]%}%d"
  Z="%{$fg_bold[green]%}Ƶ %{$reset_color%}"
}

precmd () {
  countItems
  displayHUD
  setupLegendaryPrompt

  PROMPT="$NAVI 
$TRIFORCE[1] $FLOOR
$TRIFORCE[2] $CASTLE $ITEM_HUD 
${zHUD[@]}$Z"
  RPROMPT="${INFO[@]}"
  # END: precmd
}

<< ///////////////////////////////////////////////////////////////////
  EXECUTION
///////////////////////////////////////////////////////////////////

# Used HEY_LISTEN to skip splash and have Navi say something instead
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

# ITEM SHORTCUTS
# SEARCH=$MAGIC[lantern]
# BELL="${HISTORY}h"
# CLEAR="${TRASH}CL"
# CLOSE=$MAGIC[exit]

# local _prompt="$(echo -e "${NERDISH_SYMBOL_PROMPT:-"\uf105"}")"
# local _directory="$(echo -e "${NERDISH_SYMBOL_DIRECTORY:-"\uf0a0"}")"
# local _branch="$(echo -e "${NERDISH_SYMBOL_GIT_BRANCH:-"\ue725"}")"
# local _action="$(echo -e "${NERDISH_SYMBOL_GIT_ACTION:-"\uf101"}")"
# local _staged="$(echo -e "${NERFISH_SYMBOL_GIT_STAGED:-"\uf055"}")"
# local _unstaged="$(echo -e "${NERDISH_SYMBOL_GIT_UNSTAGED:-"\uf059"}")"
# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"