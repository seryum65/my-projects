#! /bin/bash
back_up() {
   NOW=$(date '+%Y-%m-%d %H-%M-%S')
   tar cvzf "backup.$NOW.tar.gz" $1
   echo "Backup was created from $1" 
}

back_up /var/log/cloud-init.log