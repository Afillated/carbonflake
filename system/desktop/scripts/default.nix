{ pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.writeScriptBin "elephant-bridge" ''
      #!${pkgs.python3}/bin/python3
      ${builtins.readFile ./elephant-bridge.py}
    '')
  ];
}
