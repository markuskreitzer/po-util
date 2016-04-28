#!/bin/bash
if [ -f ~/po-util.sh ];
then
  rm ~/po-util.sh
  curl -fsSLO https://raw.githubusercontent.com/nrobinson2000/po-util/master/po-util.sh
  mv po-util.sh ~/po-util.sh
  chmod +x ~/po-util.sh
else
  curl -fsSLO https://raw.githubusercontent.com/nrobinson2000/po-util/master/po-util.sh
  mv po-util.sh ~/po-util.sh
fi

if [ -f ~/.bash_profile ];
then
  echo
else
echo "
export PATH=\"/usr/local/sbin:$PATH\"
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi" >> ~/.bash_profile
fi

if [ -f ~/.bashrc ];
then
  echo ".bashrc present"
  if cat ~/.bashrc | grep "po-util.sh" ;
  then
    echo "po alias already in place."
  else
    echo "no po alias."
    echo 'alias po="~/po-util.sh"' >> ~/.bashrc
  fi
else
  echo "No .bashrc present"
  echo 'alias po="~/po-util.sh"' >> ~/.bashrc
fi

~/po-util.sh install && echo && echo "Sucessfully installed the Particle Offline Utility and necessary dependencies!" && echo "Read more at https://github.com/nrobinson2000/po-util"
