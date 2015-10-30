#!/usr/bin/env bash

# assumes vim & git executables are available
# 

echo "---------------"
echo "Setting up vim:"
echo "- pathogen"
echo "- syntastic"
echo "---------------"

# install pathogen for vim
if [ ! -d /home/vagrant/.vim/autoload ]; then
	mkdir -p /home/vagrant/.vim/autoload
fi
if [ ! -d /home/vagrant/.vim/bundle ]; then
	mkdir -p /home/vagrant/.vim/bundle
fi
curl --insecure --silent -L https://tpo.pe/pathogen.vim -o /home/vagrant/.vim/autoload/pathogen.vim

cat > /home/vagrant/.vimrc <<EOL
" setup pathogen
execute pathogen#infect()

" configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
EOL

# get syntastic
cd /home/vagrant/.vim/bundle
if [ -d syntastic ]; then
	cd syntastic && git pull
else
	git clone https://github.com/scrooloose/syntastic.git
fi

# get elixir.vim
cd /home/vagrant/.vim/bundle
if [ -d vim-elixir ]; then
	cd vim-elixir && git pull
else
	git clone https://github.com/elixir-lang/vim-elixir.git
fi

