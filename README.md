# Neovim configurations

My current neovim configurations.

## Nix-tuned

This configuration has been thought to work in Nix. In this sense, it is doing less, not
more (apart from configuring the Nix-related plugins, among other languages).

The main difference from what I would have done in Nix-less environment is the absence
of [mason.nvim](https://github.com/williamboman/mason.nvim)* and related.
With Nix around (especially with [flakes](https://nixos.wiki/wiki/Flakes)) is not
possible to rely on someone else installing packages. On the other hand, Nix is
providing its own mechanism to install whatever package.

So, to use these configurations, either install manually the [required
servers](./lua/plugins/language/lsp-zero.lua), or check the companion [Home
Manager](https://nix-community.github.io/home-manager/)
[module](https://github.com/AleCandido/nixpkgs/blob/main/home/neovim/servers.nix).

*: essentially the language servers package manager

## Previous iterations

- [migrated from vim](https://github.com/AleCandido/dotfiles/tree/ubuntu/.config/nvim)
