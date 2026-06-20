{ pkgs, inputs, ... }: {
  environment.systemPackages = with pkgs; [
    ryubing
    pcsx2
    shadps4-qtlauncher
  ];
}
