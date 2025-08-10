{pkgs, inputs, ...}:{
 programs.nh = {
    enable = true;
    flake = "/home/carbon/carbonflake";
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 8";
    };
  };


  
}
