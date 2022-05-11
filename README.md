# Installation

# Brew packages

```bash
# Installing all required brew commands
brew install git wget zsh z fzf ag rg pgcli nvm erlang elixir go@1.17
```

VIM search requirements:

```bash
$ brew install fzf ag rg
```

# NeoVIM installation

First install neovim

```bash
brew install neovim
```

To start the transition, create your |init.vim| (user config) file:

Open `nvim` and run this commands:

```
:call mkdir(stdpath('config'), 'p')
:exe 'edit '.stdpath('config').'/init.vim'
```

Add these contents to the file:
```
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```

Install VIM.Plug

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open `nvim` and run 

```bash
:PlugInstall
```

Run check for `python` and provider, almost sure it wouldn't be installed.

Install `python-provider`

```bash
python3 -m pip install --user --upgrade pynvim
```


## Elixir-LS VIM installation
After installing everything in vim you have to install `coc-elixir` plugin.

```
:CocInstall coc-elixir
```

And it wouldn't work. 
Next you will have to download elixir-ls release from https://github.com/elixir-lsp/elixir-ls/releases
And place it under: `~/.config/coc/extensions/node_modules/coc-elixir/els-release`

```bash
$ find ~ -name 'language_server.sh'
~/.config/coc/extensions/node_modules/coc-elixir/els-release/language_server.sh
```

Example:

```bash
$ rm -rf ~/.config/coc/extensions/node_modules/coc-elixir/els-release/*
$ cd ~/Downloads
$ unzip elixir-ls.zip -d ~/.config/coc/extensions/node_modules/coc-elixir/els-release/
```

And rebuild `.elixir_ls` cache. 

Special configuration for `coc.nvim`
Use command to open config (normally `~/.config/nvim/coc-settings.json`):

```
:CocConfig
```

And place this content into opened file:

```
{
  "suggest.autoTrigger": "none",
  "elixirLS.mixEnv": "dev",
  "elixirLS.mixTarget": "test",
}
```
