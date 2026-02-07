{config,pkgs, ...}: {

  environment.systemPackages = with pkgs; [ dualsensectl ];

  
  environment.sessionVariables.ALSA_CONFIG_UCM2 = let
    dualsense-ucm-conf = pkgs.alsa-ucm-conf.overrideAttrs (oldAttrs: {
      patches =
        (oldAttrs.patches or [])
        ++ [
          ../config/patches/dualsense-alsa-fix.patch
        ];
    });
  in "${dualsense-ucm-conf}/share/alsa/ucm2";    
      
      
  
}
