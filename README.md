# How to use?

    cd ~
    git clone https://github.com/agostini01/dotfiles.git

    ln -sf dotfiles/.gitignore_global .gitignore_global
    ln -sf dotfiles/.tmux.conf        .tmux.conf
    ln -sf dotfiles/.vimrc            .vimrc
    ln -sf dotfiles/.ctags            .ctags


And perhaps you should add some of the key bindings to you bashrc file

    cat dotfiles/.bashrc_binds  >> .bashrc

If you are using cmake for your projects, you can make use of the
.ClangOverrides file

    cmake -DCMAKE_USER_MAKE_RULES_OVERRIDE=~/dotfiles/.ClangOverrides.txt ..
