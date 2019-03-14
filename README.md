# How to use?

    cd ~
    git clone https://github.com/agostini01/dotfiles.git

    ln -sf dotfiles/.gitignore_global .gitignore_global
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ln -sf dotfiles/.vimrc            .vimrc
    ln -sf dotfiles/.ctags            .ctags
    ln -sf dotfiles/.inputrc          .inputrc

    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    ln -sf dotfiles/.tmux.conf        .tmux.conf

And perhaps you should add some of the key bindings to you bashrc file

    cat dotfiles/.bashrc_binds  >> .bashrc

If you are using cmake for your projects, you can make use of the
.ClangOverrides file

    cmake -DCMAKE_USER_MAKE_RULES_OVERRIDE=~/dotfiles/.ClangOverrides.txt ..

# Some features

## .ctags

It can be started with `ctags -R .`

* Ignores `.git` and `build` folders

## .inputrc

* Enables `Ctrl+p` to autocomplete commands searching command history backwards;
* autocomplete does not care about case, and adjusts the command if there is
only a specific case for completion

## .tmux.conf

Remaps tmux `Ctrl+b` to `Ctrl+a`.

* `Ctrl+a -` splits window vertically
* `Ctrl+a |` splits window side by side (note the vertical bar "|" character)

## Configure X1Y3 trackpad and nav buttons

The script `conf-x1y3-trackpad.sh` requires to be run on resume or startup
for this reason this script should be called at user login.

This must be executed once so it gets called by you login manager such as sddm.
```
echo -e "\n[[ -f ~/dotfiles/conf-x1y3-trackpad.sh ]] && . ~/dotfiles/conf-x1y3-trackpad.sh" >> ~/.bash_profile
```
