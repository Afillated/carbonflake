{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    wallust
  ];
  # hjem.users.carbon.files = {}; imma do this in a bit
}
