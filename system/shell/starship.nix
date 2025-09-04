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

  hjem.users.carbon.files = {
    ".config/starship.toml".source = ../../config/starship/starship.toml; 
  };
}
