# Setting up windows to sane development configs

# Some applications to install

* autohotkey (windows store)
* vscode (windows store)
* windows-terminal (windows store)

## Windows terminal

After installation you should link the provided `settings.json` file:

```
# Link
dotfiles/windows/windows-terminal/settings.json

# To
C:\Users\Agostini\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
```

## Inside wsl

Copy default `config` from gist.

After `.ssh/config` has been set, one should make sure that only the user has
the correct read permissions:

```
chmod 600 ~/.ssh/config
chown $USER ~/.ssh/config
```