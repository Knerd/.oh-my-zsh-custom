###### METHODS ######
# Load all of custom configurations from custom/$1
source_dir(){
  DIR=$1
  for config_file ($ZSH_CUSTOM/$DIR/*.zsh(N)); do
    source $config_file
  done
}

##### EXECUTION #####
  # source aliases
  source_dir aliases

###### CLEANUP ######
  unset source_dir