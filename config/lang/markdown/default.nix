{ lib, ... }:
with lib; {
  extraFiles = {
    "after/queries/markdown/textobjects.scm" = readFile ./textobjects.scm;
  };
}
