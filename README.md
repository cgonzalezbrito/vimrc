![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# I'm learning VIM

My VIMRC file will be update according to my learning process. There is a tips file.

## Installing MINPAC  

$ mkdir -p $VIMCONFIG/pack/minpac/opt
$ cd $VIMCONFIG/pack/minpac/opt
$ git clone https://github.com/k-takata/minpac.git

## Installing fzf

$ cd $VIMCONFIG/pack/bundle/start
$ git clone https://github.com/junegunn/fzf
$ $VIMCONFIG/pack/bundle/start/fzf/install --bin

export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin
