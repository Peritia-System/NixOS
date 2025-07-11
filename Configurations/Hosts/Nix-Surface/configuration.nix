{ config, lib, pkgs, inputs, ... }:

with lib;

let
  cfg = config.surfaceSupport;
in {
  options.surfaceSupport = {
    enable = mkEnableOption "Enable Surface Pro hardware support (Kaby Lake / i5-7300U)";
  };

  config = mkIf cfg.enable {

    ############################################################
    # 🧩 Surface Pro 5 (2017) Kernel Modules & Hardware Support
    ############################################################

    imports = [
      inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
    ];

    boot.kernelModules = [
      "hid-microsoft"
    ];

    boot.initrd.kernelModules = [

      # Surface Aggregator Module (SAM)
      "surface_aggregator"
      "surface_aggregator_registry"
      "surface_aggregator_hub"
      "surface_hid_core"
      "surface_hid"

      # Intel Low Power Subsystem
      "intel_lpss"
      "intel_lpss_pci"
      "8250_dw"
    ];

    # You do NOT need IPTSd — touchscreen/pen should work via HID
    services.iptsd.enable = lib.mkForce false;

    # Optional:
    # boot.kernelParams = [ "i915.enable_psr=0" ];
    # boot.blacklistedKernelModules = [ "surface_gpe" ];
  };
}
