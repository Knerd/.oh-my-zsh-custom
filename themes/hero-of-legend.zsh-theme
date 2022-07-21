source <(curl -fsSL https://raw.githubusercontent.com/Knerd/.oh-my-zsh-custom/master/bin/_hero-helpers)
: '////////////////////////////////////////////////////////////////////////
  SETTINGS
//////////////////////////////////////////////////////////////////////////'
  HERO_HIDE_ITEMS=0
  HERO_HIDE_CLOCK=0
  HERO_HIDE_NAVI=0
  HERO_HIDE_EVERYTHING=0
  
  # Hero of Legend bin scripts
  HERO_BIN="$HOME/.oh-my-zsh/custom/bin"
  export PATH="$HERO_BIN:$PATH"

  # Hero of Legend Aliases
  source $ZSH_CUSTOM/aliases/hero-shortcuts.alias.zsh

  alias z+='z; bash -c "$(curl -fsSL https://raw.githubusercontent.com/Knerd/.oh-my-zsh-custom/master/bin/hero-magic-chest)"'
: '////////////////////////////////////////////////////////////////////////
  CONSTANTS
//////////////////////////////////////////////////////////////////////////'

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

  declare QUOTES=(
    "${NPC[wizard]}️ Its dangerous to go alone. Take this!"
    "${NPC[king]}️ Well excuse me, princess!"
    "${NPC[fairy]} Hey, listen!"
    "${NPC[elf]} Zshhhhh, Its a secret to everybody."
    # "👺 Grumble, Grumble"
    # "${NPC[man]}️  I am Error"
    # "${NPC[dragon]}️ Dodongo Dislikes Smoke"
    # "${NPC[fairy]} Hey, Wake up $USER!"
  )

  # INTRODUCE AREA 
  declare -A AREA=(
    [branch]=🚧     
    [cart]=🛒       
    [castle]=🏰  
    [controller]=🎮 
    [door]=🚪 
    [dungeon]=️💀
    [moon]=🌙 
    [shop]=🏪
    [sun]=🌞 
  )

  # INTRODUCE HERO - LEGEND OF ICONS
  declare -A HERO=(
    [compass]=🧭    # Compass
    [key]=️️🔑        # Magic Key
    [map]=🗺        # Compass
    [sword]=️🗡️      # Magic Sword
    [swords]=⚜️      # 
    [toolbox]=🧰    # Toolbox
    [trash]=🗑       # Trash
    [tunic]=👕
    [watch]=⌚      # Watch

    [bean]=🌱       # Magic Bean 
    [bomb]=💣       # Magic Bomb 
    [book]=📗       # Magic Book
    [boomerang]=🪃  # Magic Boomerang
    [boots]=🥾      # Magic Boots
    [bottle]=🏺     # Magic Bottle
    [bow]=🏹        # Magic Bow
    [exit]=💥       # Magic Exit
    [flashlight]=🔦 # Magic Lantern
    [hammer]=🔨     # Magic Hammer
    [mirror]=🔍     # Magic Mirror
    [mushroom]=🍄   # Magic Mushroom
    [poll]=🎣       # Magic Fishing Poll
    [powder]=✨     # Magic Powder 
    [scroll]=📜     # Magic Scroll
  )

  # MAGIC BUTTONS -  Match keys to HERO items
  declare -A BUTTONS=(
    [bean]="B"
    [bomb]="b"
    [boomerang]=" P"
    [boots]="?"
    [bottle]="M"
    [bow]="a"
    [exit]="x"
    [hammer]="A"
    [key]="k"
    [lantern]="f"
    [mirror]="D"
    [mushroom]="S"
    [poll]="p"
    [powder]="CO"
    [scroll]="C"
    [sword]="z"
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

  ZSH_THEME_GIT_PROMPT_PREFIX="\n%{$fg_bold[white]%}-LVL- ${AREA[dungeon]}%{$fg_bold[white]%} "
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_CLEAN=$LIFE[clean]
  ZSH_THEME_GIT_PROMPT_DIRTY=$LIFE[dirty]

  # CLOCK COUNTER
  TMOUT=1

: '////////////////////////////////////////////////////////////////////////
                          METHODS/FUNCTIONS 
//////////////////////////////////////////////////////////////////////////'
TRAPALRM() {
  zle reset-prompt
}

maxOutAt99(){
  NUM=$1
  if [ $NUM -gt 99 ] ; then
    NUM=99 
  fi
  return $NUM
}

countItems(){
  # ARROWS 
  DOWNLOADS=$( ls -p ~/Downloads/ | grep -v / | wc -l )

  # BOMBS
  TRASH_SIZE=(${$(du --human-readable --summarize -csh --block-size=1G ~/.local/share/Trash)//G/ })
  TRASH_SIZE=$( printf "%.0f" $TRASH_SIZE[1] )

  # KEYS
  KEYS=0
  if [ $(pwd) != "/" ]; then 
    # COUNT HOW MANY DIRECTORIES DEEP WE ARE
    KEYS=$(pwd | awk -F"/" '{print NF-1}; ')
  fi

  # ITEMS
  maxOutAt99 $DOWNLOADS
  ARROWS=$(printf '%02d' $?)

  maxOutAt99 $TRASH_SIZE
  BOMBS=$(printf '%02d' $?)

  maxOutAt99 $KEYS
  KEYS=$(printf '%02d' $?)

  zHUD=(
    "ˣ$ARROWS"
    "ˣ$BOMBS"
    "ˣ$KEYS"
  )

  # CLOCK
  # "-TIME-"
  CLOCK=(
    "%{$fg[yellow]%}%D{%b}${AREA[sun]}%{$fg[cyan]%}%D{%d}"
    "${AREA[moon]}%D{%a}%{$reset_color%}"
    "${HERO[watch]}%D{%I:%M:%S%P}"
  )
}

# TODO: Refactor this...
displayHUD(){
  if [ $HERO_HIDE_CLOCK = 1 ]; then
    CLOCK=""
  fi

  INFO=(
    "${AREA[controller]}%{$fg[white]%}%m"
    "$CLOCK[@]"
  )

  # THE TRIFORCE
  TRIFORCE_HYRULE=(
    " %{$fg_bold[yellow]%} ▲ " 
    " %{$fg_bold[yellow]%}▲ ▲"
  )

  TRIFORCE_LOWRULE=(
    " $fg_bold[yellow]⯆ ▼" 
    " $fg_bold[yellow] ⯆ "
  )

  ITEM_HUD=""

  # GIT PROMPT
  if [ "$(git_prompt_info)" ]; then
    if [ "$HERO_HIDE_ITEMS" = "1" ]; then
      ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
      zHUD=()
    else
      ZSH_THEME_GIT_PROMPT_SUFFIX="\n%{$light_gray%}%{$HUD[@]%} %{$GIT_HUD[@]%}"
    fi
    ITEM_HUD="$(git_prompt_info)" 
    TRIFORCE=($TRIFORCE_LOWRULE)
  else
    if [ "$HERO_HIDE_ITEMS" = "1" ]; then
      ITEM_HUD=""
      zHUD=()
    else
      ITEM_HUD=$(echo -e "\n%{$light_gray%}%{$HUD[@]%}")
    fi
    TRIFORCE=($TRIFORCE_HYRULE)
  fi
}

# HERO OF LEGEND TERMINAL PROMPT
setupLegendaryPrompt(){
  if [ $HEY_LISTEN ]; then
    if [ $HOL_NPC ]; then
      NAVI="${NPC[$HOL_NPC]} \"${HEY_LISTEN}\""
    else
      NAVI="${NPC[fairy]} \"Hey, listen! ${HEY_LISTEN}\""
    fi

    HEY_LISTEN=""
    HOL_NPC=""
  else
    NAVI=${QUOTES[ $RANDOM % ${#QUOTES[@]} ]:0}
  fi
  if [ $HERO_HIDE_NAVI = 1 ]; then
    NAVI=""
  fi
  FLOOR="${AREA[door]} %{$reset_color%}%{$fg_bold[green]%}%c"
  CASTLE="${AREA[castle]} %{$reset_color%}%{$fg[cyan]%}%d"
  Z="%{$fg_bold[green]%}Ƶ %{$reset_color%}"
}

precmd () {
  countItems
  displayHUD
  setupLegendaryPrompt

  if [ $HERO_HIDE_EVERYTHING = 1 ];  then
    PROMPT="$CASTLE $ITEM_HUD 
%{$fg_bold[white]%}🔑ˣ$KEYS $Z"
    RPROMPT=""
  else
    PROMPT="${INFO[@]} 
$TRIFORCE[1] $FLOOR
$TRIFORCE[2] $CASTLE $ITEM_HUD 
%{$fg_bold[white]%}${zHUD[@]} $Z"
    RPROMPT="$NAVI"
  fi

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

                    PRESS START (z+) 
                      options (o) 
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

# DEPRICATED
# _l="$fg[blue][$fg[white]"
# _rl="$reset_color$fg[blue]|$fg[white]"
# _r="$fg_bold[blue]$reset_color$fg[blue]]$reset_color"

# local _prompt="$(echo -e "${NERDISH_SYMBOL_PROMPT:-"\uf105"}")"
# local _directory="$(echo -e "${NERDISH_SYMBOL_DIRECTORY:-"\uf0a0"}")"
# local _branch="$(echo -e "${NERDISH_SYMBOL_GIT_BRANCH:-"\ue725"}")"
# local _action="$(echo -e "${NERDISH_SYMBOL_GIT_ACTION:-"\uf101"}")"
# local _staged="$(echo -e "${NERDFISH_SYMBOL_GIT_STAGED:-"\uf055"}")"
# local _unstaged="$(echo -e "${NERDISH_SYMBOL_GIT_UNSTAGED:-"\uf059"}")"
# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
