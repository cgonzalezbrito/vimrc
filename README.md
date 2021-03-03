![VIM](https://www.vim.org/images/vim_small.gif)

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
