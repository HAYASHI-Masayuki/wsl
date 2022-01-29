cd ~/src

git clone https://github.com/koron/guilt.git
cd guilt
sudo make install
cd -

if [ ! -d vim-kaoriya ]; then
    # https://github.com/koron/vim-kaoriya
    git clone https://github.com/koron/vim-kaoriya.git
    cd vim-kaoriya
    git checkout develop
    git submodule init
    git submodule update

    cd vim
    git checkout master
    git config guilt.patchesdir ../patches
else
    cd vim-kaoriya
    git pull

    cd patches
    git checkout -- .
    cd -

    cd vim
    git checkout -- .
    cd -

    git submodule update

    cd vim
    git checkout master
    git pull
fi

# http://qiita.com/baboocon/items/78e0ce9b32bdbd6bb98a
cd src
guilt push -a -f
guilt push -a -f # 一回だけだと止まる場合がある？
make autoconf

cd -
LIBS=-lmigemo ./configure \
    --with-features=huge \
    --enable-migemo \
    --prefix=/usr/local &&
make -j$(nproc) &&
sudo make install &&
make clean

cd ..

sudo cp -a kaoriya/vim/* /usr/local/share/vim/ &&
sudo cp -a contrib/* /usr/local/share/vim/plugins &&
sudo mkdir -p /usr/local/share/vim/switches/enabled &&
sudo mv /usr/local/share/vim/switches/catalog/utf-8.vim /usr/local/share/vim/switches/enabled
