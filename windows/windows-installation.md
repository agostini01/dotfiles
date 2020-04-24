# Setting up windows to sane development configs

# Important steps

Make sure you have the windows PRO version installed:

```
1. Click Win+S at the same time.
2. Type in 'Activation settings' and open it.
3. Take a note of your 'Edition'.
```

If you're Edition is anything but 'Windows 10 Pro', fix it.

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