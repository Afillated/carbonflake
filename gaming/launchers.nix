{pkgs, inputs ,...}: {

  environment.systemPackages = with pkgs; [
    prismlauncher
    (lutris.override {
    # List of additional system libraries
    extraLibraries = pkgs: [ ];

    # List of additional system packages    
    extraPkgs = pkgs: [ ];
  })
    winetricks
  ];
}
