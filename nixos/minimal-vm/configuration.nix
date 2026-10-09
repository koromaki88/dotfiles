{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/packages/core.nix
    ./modules/packages/development.nix
    ./modules/packages/forensics.nix
    ./modules/android.nix
    ./modules/shell.nix
    ./modules/networking.nix
    ./modules/containers.nix
  ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/vda"; # or "nodev" for efi only

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  fileSystems."/mnt/share" = {
    device = "nix-share";
    fsType = "virtiofs";
    options = [
      "defaults"
      "nofail"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  # Keep this at the version used for the initial installation.
  system.stateVersion = "26.05";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
