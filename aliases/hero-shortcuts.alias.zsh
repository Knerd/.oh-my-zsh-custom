# ** Nerd fonts used in comment below
#  理[ A| B|ﯜ C| CO|繁 D| f| h| M| P| p|ﭾ S| CL| x]  

# Heads Up Display
: '
 ┌─┐
 ├─┤
 └─┘
'

# Classic 
# alias hud="echo ' 
# ┌💍 HUD ──a─────────────────┐  ┌Crystals──┐
# │ 🏹 a 🪃 P 🎣 p 💣 b  🍄 S │  │   💎 💎  │  
# │ 🔥a! ⚡ a+ 🌀 g ✨ CO 💥 x │  │ 💎 💎 💎 │
# │ 🔦 f 🔨 A 🎺 lt🖍 n 📗 h  │  │   💎 💎  │
# │️ 🫙 M 🌱 B 📜 C 🪞 D       │
# ├ EQUIPMENT  ───────────────┤  ┌EQUIPPED──┐
# │ 🥾 ?  🥊 e   🤿 v  🔮 t   │  │ 💍 🛡️ 👕 │   
# └───────────────────────────┘  └──────────┘
# '"

# Modern
alias hud="echo ' 
┌ 💍 HUD ───────────────────┐  ┌ CRYSTALS ┐
│ 🏹 a 💣 b 🔑 k 🗡 z 💥 x  │  │  💎 💎   │  
├ 🎒 ITEMS  ────────────────┤  │ 💎 💎 💎 │
│ 🔥 a! 🔦 f 🎺 lt          │  │   💎 💎  │     
│ ⚡ a+ 📗 h 🖍 m           │  └──────────┘
├ 🧰 GIT TOOLS ─────────────┤  ┌ EQUIPPED ┐
│ 🌀 g 🪃 P 🎣 p ✨ CO 🍄 S │  │ 💍 🛡️ 👕 │ 
│ 🔨 A 🌱 B 📜 C 🪞 D  🫙 M │  ├ DUNGEON ─┤
├ 🤺 DO ────────────────────┤  │ 🗺️ 🧭 🔑 │
│ 🥾 ?  🥊 G  🤿 v  🔮 t    │  └──────────┘  
└───────────────────────────┘ 
'"
alias i="((HERO_HIDE_ITEMS=!HERO_HIDE_ITEMS)); CL"

alias z="CL; hud"
alias z+='bash -c "$(curl -fsSL https://raw.githubusercontent.com/Knerd/hero-bin/develop/hero-magic-chest)"'

# ITEMS
alias arw="~/Downloads; ls -l; echo '🏹 ---> Nice shot! Straight to Downloads. 🎯'"
alias a=arw
alias a!="hero-fire-arrows"
alias a+="hero-light-arrow"

alias bomb="hero-magic-bomb"
alias b=bomb
alias b\?="bomb --help"
alias b!="bomb !"
alias b-="bomb l"
alias b+="bomb file"

alias G="rm -i vendor; rm -i node_modules; yarn"
alias m="source hero-magic-marker"
alias m-="source hero-magic-marker -d"

# Find things
# Find a file recursively
alias f='find . | grep ' 
alias F='f'

# Find an old command
alias h='history | grep '
alias H='h'

# "Keys"
alias k="source hero-magic-key"
alias k2="k 2"
alias k3="k 3"
alias k4="k 4"
alias k5="k 5"
alias k6="k 6"
alias k7="k 7"
alias k8="k 8"
alias k9="k 9"

# Clear terminal
alias CL='clear'
# Close terminal
alias x='exit'

#### Add git shortcuts - listed in hero-of-legend zsh-theme terminal 
alias A='git add '
alias B='git checkout -b'
alias C='git commit -m '
alias CO='git checkout '
alias D='git diff '
alias M='git merge '
alias P='git push'
alias p='git pull'
alias S='git status '

# GIT FLOW
alias g="git flow "
alias g.="g release "
alias g+="g feature "
alias g!="g hotfix "
alias g\?="g bugfix"
alias g+s="g+ start"
alias g+p="g+ publish"
alias g+f="g+ finish"
alias g!s="g! start"
alias g!p="g! publish"
alias g!f="g! finish"
alias g\?s="g? start"
alias g\?p="g? publish"
alias g\?f="g? finish"
alias g.s="g. start"
alias g.p="g. publish"
alias g.f="g. finish"

declare -A HERO_HELP=(
    [z]="🗡️  z  - Sword: Wipes the screen, shows your inventory, and awaits your next command."
    [k]="🗝️  k  - Keys: # of child directorys; k[1-9] Uses # of keys to cd .. that many times."
    [b]="💣 b  - Bombs: # of Gigs in Trash; b/bomb blows up the trash bin, b+ [FILE] moves file to trash, b- lists trash"
    [a]="🏹 a  - Arrows: # of files in ~/Downloads; a/arw is a direct shot to ~/Downloads"
    [x]="💥 x  - Quake: Close the terminal"
    [f]="🔦 f  - Magic Lantern aka Flashlight: Search the castle for files that match"
    [h]="📗 h  - Magic Book of History: Search through the history of CLI command inputs"
    [n]="🖍️  n  - Magic Marker: Quickly save code snippets. n/net [snippet] Saves to ~/code-net"
    [A]="🔨 A  - Magic Hammer: git add"
    [B]="🌱 B  - Magic Bean:   git checkout -b"
    [C]="📜 C  - Magic Scroll: git commit -m"
    [D]="🪞  D  - Magic Mirror: git diff"
    [g]="🌀 g  - Git Flow:   git flow; g+,g!,g?,g."
    [M]="🍯 M  - Magic Pot: git merge"
    [P]="🪃  P  - Magic Boomerang: git push"
    [p]="🎣 p  - Magic? Fishing Poll: git pull"
    [S]="🍄 S  - Magic Mushroom: git status"
    [G]="🥊 G  - Power Glove: Custom Heavy Lifting command. Default: rm vendor; rm node_modules; yarn"
    [v]="🤿 v  - Flippers: Coming Soon* Throw on your flippers(VPN) and take a secure dive into the deep web."
    [t]="🔮 t  - Crystal Ball: HTop"
    [CO]="✨ CO - Magic Powder: git checkout"
    [a+]="⚡️ a+ - Light Arrows: Bookmark Direct Travel to any location at the speed of light"
    [a!]="🔥 a! - Fire Arrows: Burn through all your downloads - one at a time. Uses rm -i."
    [lt]="🎺 lt - Magic Trumpet: Use LocalTunnel to open a pubically accessible portal to any local port."
)

# Help 
alias \?z="echo '${HERO_HELP[z]}'"
alias \?k="echo '${HERO_HELP[k]}'"
alias \?b="echo '${HERO_HELP[b]}'"
alias \?a="echo '${HERO_HELP[a]}'"
alias \?x="echo '${HERO_HELP[x]}'"
alias \?f="echo '${HERO_HELP[f]}'"
alias \?h="echo '${HERO_HELP[h]}'"
alias \?n="echo '${HERO_HELP[n]}'"
alias \?A="echo '${HERO_HELP[A]}'"
alias \?B="echo '${HERO_HELP[B]}'"
alias \?C="echo '${HERO_HELP[C]}'"
alias \?D="echo '${HERO_HELP[D]}'"
alias \?I="echo '${HERO_HELP[I]}'"
alias \?M="echo '${HERO_HELP[M]}'"
alias \?P="echo '${HERO_HELP[P]}'"
alias \?p="echo '${HERO_HELP[p]}'"
alias \?S="echo '${HERO_HELP[S]}'"
alias \?G="echo '${HERO_HELP[G]}'"
alias \?v="echo '${HERO_HELP[v]}'"
alias \?t="echo '${HERO_HELP[t]}'"
alias \?CO="echo '${HERO_HELP[t]}'"
alias \?a+="echo '️${HERO_HELP[a+]}'"
alias \?a!="echo '️${HERO_HELP[a!]}'"
alias \?lt="echo '${HERO_HELP[lt]}'"

alias \?="echo '
┌ 💍 HUD ──────────────────────────────────────────────────────────────────────────────────
│ ${HERO_HELP[z]}
│ ${HERO_HELP[k]}
│ ${HERO_HELP[b]}
│ ${HERO_HELP[a]}
│ ${HERO_HELP[x]}
├ 🎒 ITEMS ────────────────────────────────────────────────────────────────────────────────
│ ${HERO_HELP[a+]}
│ ${HERO_HELP[a!]}
│ ${HERO_HELP[f]}
│ ${HERO_HELP[h]}
│ ${HERO_HELP[n]}
├ 🧰 GIT TOOLS aka GITCUTS ────────────────────────────────────────────────────────────────
│ ${HERO_HELP[A]}
│ ${HERO_HELP[B]}
│ ${HERO_HELP[C]}
│ ${HERO_HELP[D]}
│ ${HERO_HELP[I]}
│ ${HERO_HELP[M]}
│ ${HERO_HELP[P]}
│ ${HERO_HELP[p]}
│ ${HERO_HELP[S]}
├ 🤺 EQUIPMENT ──────────────────────────────────────────────────────────────────────────────────
│ 🥾 ?  - Pegus Boots: Run this Help menu, become uber-micro-fast by honing in on your CLI skills. 
│ ${HERO_HELP[G]}
│ ${HERO_HELP[v]}
│ ${HERO_HELP[t]}
├ EQUIPED ──────────────────────────────────────────────────────────────────────────────────
│ 💍 Pendant: Shows if hero-of-legend bin scripts are in use
│ 🛡️  Sheild: Shows if hero-of-legend aliases are in use
│ 👕 Tunic: This Theme
└─────────────────────────────────────────────────────────────────────────────────────────
👕 $USER used the Pegasus Boots 🥾. Now they can run commands super quick!
'|less"

alias trash-size="du --human-readable --summarize -csh --block-size=1G ~/.local/share/Trash"

# alias hud="echo ' 
# ┌💍 HUD ────────────────────┐  ┌Crystals──┐
# │ 🗡 z 🗝 k 🏹 a ⚡a+ 🔥a!  │  │   💎 💎  │  
# ├───────────────────────────┤  │ 💎 💎 💎 │
# │ 🎒 ITEMS  💣 b  💥 x      │  │   💎 💎  │     
# │ 🔦 f 📗 h 💣 b? 🎺 lt 🖍 n │  └──────────┘
# ├───────────────────────────┤  ┌z┐ ┌ k ┐
# │ 🧰 GIT TOOLS              │ ️ 🗡   🔑 
# ├───────────────────────────┤  └─┘ └───┘
# │ 🔨 A 🌱 B 📜 C ✨ CO 🪞 D │
# │ 🌀 I 🍯 M 🪃 P 🎣 p  🍄 S │ 
# ├───────────────────────────┤  
# │ EQUIPMENT                 │  ┌EQUIPPED──┐    
# │ 🥾 ?  🥊 e   🤿 v  🔮 t   │  │ 💍 🛡️  👕 │   
# └───────────────────────────┘  └──────────┘
# '"