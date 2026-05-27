{
  pkgs,
  config,
  inputs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    starship
  ];
  programs.bash.interactiveShellInit = ''eval "$(starship init bash)"'';

}
