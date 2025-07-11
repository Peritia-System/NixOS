  # Base kernel modules for Surface Pro (Kaby Lake / i5-7300U)

{ config, pkgs, lib, inputs, ... }:

with lib;

{
  options.ms-surface-custom-kernel.enable = mkEnableOption "Enable Microsoft Surface Custom Kernel";

  config = mkIf config.ms-surface-custom-kernel.enable {

    imports = [
    #(import "${inputs.nixos-hardware}/microsoft/surface/common")
    inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
    ];

    boot.kernelModules = [ "hid-microsoft" ];

    boot.initrd.kernelModules = [
      # Surface Aggregator Module (SAM) - essential for buttons, sensors, keyboard
      "surface_aggregator"
      "surface_aggregator_registry"
      "surface_aggregator_hub"
      "surface_hid_core"
      "surface_hid"

      # Intel Low Power Subsystem (keyboard, I2C, etc.)
      "intel_lpss"
      "intel_lpss_pci"
      "8250_dw"
    ];

    # You do NOT need IPTSd — touchscreen/pen should work via HID
    services.iptsd.enable = lib.mkForce false;

    # Optional: reduce flickering on some panels
    # boot.kernelParams = [ "i915.enable_psr=0" ];

    # Optional: if specific modules cause problems
    # boot.blacklistedKernelModules = [ "surface_gpe" ];


   };
}
