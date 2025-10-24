{pkgs, inputs, ...}: {





  environment.systemPackages = with pkgs; [
    ryubing
    pcsx2
  ];
}
