{
  description = "solvent neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    "vim-plugin:github-nvim-theme" = {
      url = "github:projekt0n/github-nvim-theme";
      flake = false;
    };
    "vim-plugin:nvim-quarto" = {
      url = "github:quarto-dev/quarto-nvim";
      flake = false;
    };
    "vim-plugin:nvim-otter" = {
      url = "github:jmbuhr/otter.nvim";
      flake = false;
    };
    "vim-plugin:nvim-snakemake" = {
      url = "github:osthomas/vim-snakemake";
      flake = false;
    };
    "vim-plugin:nvim-nextflow" = {
      url = "github:LokiLuciferase/nextflow-vim";
      flake = false;
    };
    "vim-plugin:jupytext-vim" = {
      url = "github:goerz/jupytext.vim";
      flake = false;
    };
    "vim-plugin:nvim-R" = {
      url = "github:jalvesaq/nvim-r";
      flake = false;
    };
    "vim-plugin:venv-selector" = {
      url = "github:linux-cultist/venv-selector.nvim/regexp";
      flake = false;
    };
    "vim-plugin:notebook-navigator" = {
      url = "github:GCBallesteros/NotebookNavigator.nvim";
      flake = false;
    };
    "vim-plugin:hydra.nvim" = {
      url = "github:anuvyklack/hydra.nvim";
      flake = false;
    };
    "vim-plugin:molten-nvim" = {
      url = "github:benlubas/molten-nvim";
      flake = false;
    };
    # "vim-plugin:image-nvim" = {
    #   url = "github:3rd/image.nvim";
    #   flake = false;
    # };
    "vim-plugin:cder" = {
      url = "github:zane-/cder.nvim";
      flake = false;
    };
  };

  outputs =
    {
      nixvim,
      flake-parts,
      nixpkgs,
      ...
    }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ ((import ./overlays/plugins.nix) inputs) ];
          };
          nixvimModule = {
            inherit pkgs;
            module = import ./config;
            extraSpecialArgs = { };
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            # Run `nix flake check .` to verify that your config is not broken
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };

          packages = {
            default = nvim;
          };
        };
    };
}
