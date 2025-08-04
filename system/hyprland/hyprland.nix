{pkgs, ...}:
{
 programs.hyprland  = {
   enable = true;
   package = pkgs.hyprland;
   withUWSM = true;
   xwayland.enable = true;
 };

 environment.systemPackages = with pkgs; [
   hyprland
   kitty
   waybar
   libnotify
   networkmanagerapplet
   pavucontrol
   wl-clipboard
   clipse
   playerctl
   hyprpicker
   libqalculate
   hyprpaper
   hyprpolkitagent
   hyprsysteminfo
   hyprland-qt-support
   hyprcursor
   hyprshot
   mako
  # walker
   rofi-wayland


   bibata-cursors

   xdg-utils
   # shared-mine-info
   glib
   gtk3
   gtk4

   
 ];

 environment.sessionVariables = {
   LIBVA_DRIVER_NAME = "nvidia";
   __GLX_VENDOR_LIBRARY_NAME = "nvidia";
   NVD_BACKEND = "direct";


    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
    

   ELECTRON_OZONE_PLATFORM_HINT = "auto";
 };
 
 programs.uwsm = {
   enable = true;
   waylandCompositors = {
     hyprland = {
       prettyName = "Hyprland";
       comment = "Hyprland compositor managed by UWSM";
       binPath = "/run/current-system/sw/bin/Hyprland";
     };
   };
 };


 xdg.portal.enable = true;
  
}
