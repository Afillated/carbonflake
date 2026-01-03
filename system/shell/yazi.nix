{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    (yazi.override {
      _7zz = _7zz-rar; # Support for RAR extraction
    })
  ];


}
