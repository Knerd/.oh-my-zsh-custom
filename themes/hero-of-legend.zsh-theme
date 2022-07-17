: '////////////////////////////////////////////////////////////////////////
  SETTINGS
//////////////////////////////////////////////////////////////////////////'
  HERO_HIDE_ITEMS=0
  HERO_MINMAL=0

: '////////////////////////////////////////////////////////////////////////
  CONSTANTS
//////////////////////////////////////////////////////////////////////////'
  # DEPRICATED
  _l="$fg[blue][$fg[white]"
  _rl="$reset_color$fg[blue]|$fg[white]"
  _r="$fg_bold[blue]$reset_color$fg[blue]]$reset_color"

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

  # INTRODUCE CHARACTERS
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
    [tunic]=👕
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

  declare -A MAGIC
  for index in "${(k)BUTTONS[@]}"; do
      MAGIC[$index]="${HERO[$index]}${BUTTONS[$index]}"
  done

  # HUDS
  declare -A LIFE=(
    [clean]=" $fg_bold[red]-LIFE- ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥ ♥%{$reset_color%}"
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

  # GIT 
  GIT_HUD=(
    $AREA[dungeon]
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

  # CLOCK COUNTER
  TMOUT=1

  # CLOCK
  CLOCK=(
    "%{$fg[yellow]%}"
    # "-TIME-"
    "${AREA[sun]}%D{%b}/%{$fg[cyan]%}%D{%d}"
    "${AREA[moon]}%D{%a}%{$reset_color%}"
    "${HERO[watch]}%D{%I:%M:%S%P}"
  )

  INFO=(
    "${AREA[controller]} %{$fg[white]%}%m"
    "$CLOCK[@]"
  )

: '////////////////////////////////////////////////////////////////////////
                          METHODS/FUNCTIONS 
//////////////////////////////////////////////////////////////////////////'
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
  if [ $HEY_LISTEN ]; then
    if [ $HOL_NPC ]; then
      NAVI="${NPC[$HOL_NPC]}: \"${HEY_LISTEN}\""
    else
      NAVI="${NPC[fairy]}: \"Hey, listen! ${HEY_LISTEN}\""
    fi

    HEY_LISTEN=""
    HOL_NPC=""
  else
    NAVI=${QUOTES[ $RANDOM % ${#QUOTES[@]} ]}
  fi
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

showSplash(){
<< SPLASH 
        ()   ╔╦╗╦ ╦╔═╗  ╦  ╔═╗╔═╗╔═╗╔╗╔╔╦╗  ╔═╗╔═╗
        )(    ║ ╠═╣║╣   ║  ║╣ ║ ╦║╣ ║║║ ║║  ║ ║╠╣ 
      o=️👁️=o  ╩ ╩ ╩╚═╝  ╩═╝╚═╝╚═╝╚═╝╝╚╝═╩╝  ╚═╝╚  
      ██||███╗███████╗██╗  ██╗███████╗██╗     ██╗     
      ╚═|███╔╝██╔════╝██║  ██║██╔════╝██║     ██║     
        ███╔╝ ███████╗███████║█████╗  ██║     ██║     
       ██|╔╝  ╚════██║██╔══██║██╔══╝  ██║     ██║     
      ██||███╗███████║██║  ██║███████╗███████╗███████╗
      ╚═||═══╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
        \/              Oh-my & The Hero-of-Legend 👕
                  press start (z) 
SPLASH
}

heyListen(){
  echo "${NPC[fairy]} $HEY_LISTEN"
  export HEY_LISTEN=""
}

: '////////////////////////////////////////////////////////////////////////
                              EXECUTE
//////////////////////////////////////////////////////////////////////////'

# skips the splash if HEY_LISTEN is set. Navi will echo that instead 
if [ $HEY_LISTEN ]; then
  heyListen
else
  showSplash
fi

  # local _prompt="$(echo -e "${NERDISH_SYMBOL_PROMPT:-"\uf105"}")"
  # local _directory="$(echo -e "${NERDISH_SYMBOL_DIRECTORY:-"\uf0a0"}")"
  # local _branch="$(echo -e "${NERDISH_SYMBOL_GIT_BRANCH:-"\ue725"}")"
  # local _action="$(echo -e "${NERDISH_SYMBOL_GIT_ACTION:-"\uf101"}")"
  # local _staged="$(echo -e "${NERDFISH_SYMBOL_GIT_STAGED:-"\uf055"}")"
  # local _unstaged="$(echo -e "${NERDISH_SYMBOL_GIT_UNSTAGED:-"\uf059"}")"
  # local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"