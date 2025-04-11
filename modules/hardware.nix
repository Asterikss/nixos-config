{...}:

{
  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.drivers = [
    pkgs.hplip
  ];
  hardware.printers = {
    ensurePrinters = [
      {
        name = "HP-DeskJet4530";
        location = "Home";
        deviceUri = "hp:/usb/DeskJet_4530_series?serial=TH61L3D1HH0661"; # from lpinfo -v output
        model = "drv:///hp/hpcups.drv/hp-deskjet_4530_series.ppd"; # from lpinfo -m | grep -i deskjet
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "HP-DeskJet4530";
  };

  hardware.bluetooth.enable = true;
  # hardware.bluetooth.powerOnBoot = true; # powers up the default Bluetooth controller on boot # https://nixos.wiki/wiki/Bluetooth

  # https://discourse.nixos.org/t/how-to-create-files-in-the-etc-udev-rules-d-directory/11929
  # https://github.com/zsa/wally/wiki/Linux-install#2-create-a-udev-rule-file
  hardware.keyboard.zsa.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Auto mount storage devices
  services.udisks2.enable = true;
}
