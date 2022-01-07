#### SYSTEM SHORTCUTS
#### UPDATE 
# distro specific  - Debian / Ubuntu and friends #
# install with apt-get
alias apt-get="sudo apt-get"
alias updatey="sudo apt-get --yes"

# update on one command
alias update='sudo apt-get update && sudo apt-get upgrade'

#### TUNE SUDO AND SU
# become root #
alias root='sudo -i'
alias su='sudo -i'

# GET SYSTEM MEMORY 
## pass options to free ##
alias meminfo='free -m -l -t'

## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'

# CPU USAGE
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

## Get server cpu info ##
alias cpuinfo='lscpu'

## older system use /proc/cpuinfo ##
# alias cpuinfo='less /proc/cpuinfo'

# GPU MEMORY 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

#### NETWORKING

#### Debug web server / cdn problems with curl
# get web server headers #
alias header='curl -I'

# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'
#### CONTROL OUTPUT OF NETWORKING TOOL CALLED PING
# Stop after sending count ECHO_REQUEST packets #
alias ping='ping -c 5'
# Do not wait interval 1 second, go fast #
alias fastping='ping -c 100 -s.2'

#### SHOW OPEN PORTS
# Use netstat command to quickly list all TCP/UDP port on the server:
alias ports='netstat -tulanp'

#### Create new set of commands
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias nowtime=now
alias nowdate='date +"%d-%m-%Y"'
