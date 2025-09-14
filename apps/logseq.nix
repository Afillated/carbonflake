{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.logseq
    pkgs.obsidian
  ];
}
