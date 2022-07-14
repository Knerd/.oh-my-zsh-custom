# ** Nerd fonts used in comment below
#  理[ A| B|ﯜ C| CO|繁 D| f| h| M| P| p|ﭾ S| CL| x]  

alias trash-size="du --human-readable --summarize -csh --block-size=1G ~/.local/share/Trash"

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
alias I='git flow init '
alias x='exit'

# Clear terminal
alias CL='clear'

# Find things
# Find a file recursively
alias f='find . | grep ' 
alias F='f'

# Find an old command
alias h='history | grep '
alias H='h'

# "Keys"
alias k="cd ../;"
alias k2="k k"
alias k3="k2 k"
alias k4="k3 k"
alias k5="k4 k"
alias k6="k5 k"
alias k7="k6 k"
alias k8="k7 k"
alias k9="k8 k"

# Heads Up Display
declare -A BAR=(
 [TL]="╔"
 [TR]="╗"

 [VR]="╠"
 [VL]="╣"

 [BL]="╚"
 [BR]="╝"

 [V]="║"
 [H]="═"
)

alias hud="echo ' 
╔💍 HUD ════════════════════╗  ╔Crystals══╗
║ 🗡 z 🗝 k 🏹 a 💣 b 💥 x    ║  ║   💎 💎  ║  
╠═══════════════════════════╣  ║ 💎 💎 💎 ║
║ 🎒 ITEMS                  ║  ║   💎 💎  ║     
║ 🔦 f 🖍 n 🎺 lt 📗 h 🔥 !  ║  ╚══════════╝
╠═══════════════════════════╣
║ 🧰 GIT TOOLS              ║ 
║ 🔨 A 🌱 B 📜 C ✨ CO 🪞 D  ║
║ 🌀 I 🍯 M 🪃 P 🎣 p  🍄 S  ║ 
╠═══════════════════════════╣  
║ EQUIPMENT                 ║  ╔EQUIPPED══╗    
║ 🥾 ?  🥊 e   🤿 v  🔮 t   ║  ║ 💍 🛡️  👕 ║   
╚═══════════════════════════╝  ╚══════════╝
'"
alias i="CL; hud"
alias z=i

# ITEMS
alias bomb="echo 💣 Bomb the Trash!; ls -l ~/.local/share/Trash/*; rm -rfi ~/.local/share/Trash/*;"
alias b=bomb
alias arw="~/Downloads; ls -l; echo '🏹 ---> Nice shot! Straight to Downloads. 🎯'"
alias a=arw

alias G="rm -i vendor; rm -i node_modules; yarn"
alias n="hero-magic-crayon"
alias n-="hero-magic-crayon -d"
# alias fire="fire-arrows"
alias a!="hero-fire-arrows"
alias a+="hero-light-arrow"

# Help 
alias \?="echo '
╔ 💍 HUD ══════════════════════════════════════════════════════════════════════════════════
║ 🗡️ z  - Sword: Wipes the screen, shows your inventory, and awaits your next command. 
║ 🗝️ k  - Keys: # of child directorys; k[1-9] Uses # of keys to cd .. that many times.
║ 💣 b  - Bombs: # of Gigs in Trash; b/bomb blows up the trash bin.  
║ 🏹 a  - Arrows: # of files in ~/Downloads; a/arw is a direct shot to ~/Downloads  
║ 💥 x  - Quake: Close the terminal
╠ 🎒 ITEMS ════════════════════════════════════════════════════════════════════════════════
║ ⚡️ a+ - Light Arrows: Bookmark Direct Travel to any location at the speed of light 
║ 🔥 a! - Fire Arrows: Burn through all your downloads - one at a time.
║ 🔦 f  - Magic Lantern aka Flashlight: Search the castle for files that match
║ 🎺 lt - Magic Trumpet: Use LocalTunnel to open a pubically accessible portal to any local port.
║ 📗 h  - Magic Book of History: Search through the history of CLI command inputs 
║ 🖍️ n  - Magic Crayon: Quickly save code snippets. n/net [snippet] Saves to ~/code-net
╠ 🧰 GIT TOOLS aka GITCUTS ════════════════════════════════════════════════════════════════
║ 🔨 A  - Magic Hammer: git add
║ 🌱 B  - Magic Bean:   git checkout -b
║ 📜 C  - Magic Scroll: git commit -m
║ ✨ CO - Magic Powder: git checkout
║ 🪞 D  - Magic Mirror: git diff
║ 🌀 I  - Initiate Flow:   git flow init; 
║ 🍯 M  - Magic Pot: git merge
║ 🪃 P  - Magic Boomerang: git push
║ 🎣 p  - Magic? Fishing Poll: git pull
║ 🍄 S  - Magic Mushroom: git status
╠ 🤺 EQUIPMENT==============================================================================
║ 🥾 ?  - Pegus Boots: Run this Help menu, become uber-micro-fast by honing in on your CLI skills. 
║ 🥊 G  - Power Glove: Custom Heavy Lifting command. Default: rm vendor; rm node_modules; yarn
║ 🤿 v  - Flippers: Coming Soon* Throw on your flippers(VPN) and take a secure dive into the deep web.
║ 🔮 t  - Crystal Ball: HTop
║
║ 💍 Pendant: Shows if hero-of-legend bin scripts are in use
║ 🛡️ Sheild: Shows if hero-of-legend aliases are in use
║ 👕 Tunic: This Theme
╚═════════════════════════════════════════════════════════════════════════════════════════
🥾 $USER used the Pegasus Boots. Now they can run commands super quick!
'"