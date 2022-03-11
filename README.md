# Installation

# Brew packages

VIM search requirements:

```bash
$ brew install fzf ag rg
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
