{
  config,
  pkgs,
  inputs,
  ...
}:

{
  environment.systemPackages = [
    pkgs.logseq
  ];
}
