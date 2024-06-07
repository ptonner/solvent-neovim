inputs: final: prev:
with builtins;
let
  pkgs = prev;
  # NOTE: from: https://github.com/traxys/nvim-flake/blob/master/flake.nix
  inputsMatching =
    prefix:
    pkgs.lib.mapAttrs' (prefixedName: value: {
      name = substring (stringLength "${prefix}:") (stringLength prefixedName) prefixedName;
      inherit value;
    }) (pkgs.lib.filterAttrs (name: _: (match "${prefix}:.*" name) != null) inputs);
in
{
  vimPlugins =
    pkgs.vimPlugins
    # NOTE: attempting to patch tree sitter glibc bug
    # // { nvim-treesitter = pkgs.vimPlugins.nvim-treesitter; }
    # NOTE: patch in custom plugins
    // (pkgs.lib.mapAttrs (
      pname: src:
      prev.vimPlugins."${pname}".overrideAttrs (old: {
        version = src.shortRev;
        src = src;
      })
    ) (inputsMatching "plugin"))
    // (pkgs.lib.mapAttrs (
      pname: src:
      prev.vimUtils.buildVimPlugin {
        inherit pname src;
        version = src.shortRev;
      }
    ) (inputsMatching "vim-plugin"));
}
