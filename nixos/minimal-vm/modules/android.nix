{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.android-tools ];

  users.groups.adbusers = { };
  users.users.cirno.extraGroups = [ "adbusers" ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ENV{ID_DEBUG_APPLIANCE}=="android", GROUP="adbusers", MODE="0660"
  '';
}
