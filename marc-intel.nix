{ config, pkgs, ... }:

{
  hardware.cpu.intel.updateMicrocode = true;

  hardware.opengl.extraPackages = with pkgs; [
    vaapiIntel
    vaapiVdpau
    libvdpau-va-gl
    intel-media-driver
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.timeout = 1;

  networking.networkmanager.enable = true;

  networking.enableIPv6 = false;

  services.smartd.enable = true;

  services.xserver.xkbVariant = "intl";

  services.xserver.wacom.enable = true;

  services.acpid.enable = true;

  services.haveged.enable = true;

  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "ondemand"; # "ondemand", "powersave", "performance", "schedutil"?

  services.mbpfan.enable = true; # only on mac

  hardware.bluetooth.enable = true;
  # hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;

  nix.gc.automatic = true;
  nix.optimise.automatic = true;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "00:05" ;
  system.autoUpgrade.allowReboot = true;

  services.fstrim.enable = true;
  boot.kernel.sysctl = { "vm.swappiness" = 1; };

}
