# Base kernel modules for Surface Pro (Kaby Lake / i5-7300U)

{ config, pkgs, lib, inputs, ... }:

with lib;

{
  options.ms-surface-custom-kernel.enable = mkEnableOption "Enable Microsoft Surface Custom Kernel";

  config = mkIf config.ms-surface-custom-kernel.enable {

    ################################################################
    # 🔧 Hardware Support: Surface Pro 5 (Kaby Lake - i5-7300U)
    ################################################################
    imports = [
      # Hardware-specific modules from nixos-hardware
      inputs.nixos-hardware.nixosModules.microsoft-surface-pro-intel
    ];

    ################################################################
    # 🧠 Kernel Modules
    ################################################################

    boot.kernelModules = [
      "hid-microsoft"
    ];

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

    ################################################################
    # ⚠️ Touchscreen Driver Override
    ################################################################

    # Touchscreen and pen support via HID, disable iptsd
    services.iptsd.enable = lib.mkForce false;

    ################################################################
    # 🧪 Optional Kernel Parameters & Tweaks
    ################################################################

    # boot.kernelParams = [ "i915.enable_psr=0" ];  # Reduce flickering
    # boot.blacklistedKernelModules = [ "surface_gpe" ];  # If causing issues
  };
}
