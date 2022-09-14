#!/usr/bin/env bash

cd /usr/local/bin
[ ! $1 ] && printf "Name your script\n" 
[ ! -f $1 ] && touch $1 && chmod 755 $1 && printf "#!/usr/bin/env bash\n\n" && vim $1
