#This script makes a backup into another system via SSH
#v: verbose
#r: recursive but doesn't keeep permissions
#a: recursive but keeps permissions
#z: compress data on copy
#h: human readable

rsync -rh -e ssh /path/ user@0.0.0.0:/path/to/remote/ssh
