{ pkgs, config, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];

  # Fuck Nvidia
  # Load nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "nvidia" ];
  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };
  hardware.nvidia = {
    # open = false;
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;
    # powerManagement.enable = false;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    # package = config.boot.kernelPackages.nvidiaPackages.production;
    # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #   version = "555.58.02";
    #   sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
    #   sha256_aarch64 = "sha256-wb20isMrRg8PeQBU96lWJzBMkjfySAUaqt4EgZnhyF8=";
    #   openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
    #   settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
    #   persistencedSha256 = "sha256-a1D7ZZmcKFWfPjjH1REqPM5j/YLWKnbkP9qfRyIyxAw=";
    # };
    package = config.boot.kernelPackages.nvidiaPackages.latest;

    # fuck nvidia
    # package = let
    #     rcu_patch = pkgs.fetchpatch {
    #         url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
    #         hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
    #     };
    # in config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #     # version = "550.40.07";
    #     # sha256_64bit = "sha256-KYk2xye37v7ZW7h+uNJM/u8fNf7KyGTZjiaU03dJpK0=";
    #     # sha256_aarch64 = "sha256-AV7KgRXYaQGBFl7zuRcfnTGr8rS5n13nGUIe3mJTXb4=";
    #     # openSha256 = "sha256-mRUTEWVsbjq+psVe+kAT6MjyZuLkG2yRDxCMvDJRL1I=";
    #     # settingsSha256 = "sha256-c30AQa4g4a1EHmaEu1yc05oqY01y+IusbBuq+P6rMCs=";
    #     # persistencedSha256 = "sha256-11tLSY8uUIl4X/roNnxf5yS2PQvHvoNjnd2CB67e870=";
    #
    #     # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    #     version = "555.58.02";
    #     sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
    #     sha256_aarch64 = "sha256-wb20isMrRg8PeQBU96lWJzBMkjfySAUaqt4EgZnhyF8=";
    #     openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
    #     settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
    #     persistencedSha256 = "sha256-a1D7ZZmcKFWfPjjH1REqPM5j/YLWKnbkP9qfRyIyxAw=";
    #     # };
    #
    #     # version = "535.154.05";
    #     # sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
    #     # sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
    #     # openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
    #     # settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
    #     # persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
    #
    #     patches = [ rcu_patch ];
    # };

    # https://discourse.nixos.org/t/solved-what-are-the-options-for-hardware-nvidia-package-docs-seem-out-of-date/14251
    # https://nixos.wiki/wiki/Nvidia#CUDA
    # https://nixos.wiki/wiki/Nvidia#Running_the_new_RTX_SUPER_on_nixos_stable
    # https://github.com/ryan4yin/nix-config/blob/i3-kickstarter/hosts/msi-rtx4090/default.nix
    # https://discourse.nixos.org/t/nvidia-4070-super-requires-a-specific-driver/38830
    # https://discourse.nixos.org/t/issues-with-my-nvidia-gpu-config/35327/2
    # https://github.com/vimjoyer/nixconf/blob/main/hosts/laptop/included/nvidia.nix
    # https://discourse.nixos.org/t/nvidia-4070-super-requires-a-specific-driver/38830
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/os-specific/linux/nvidia-x11/default.nix
    # https://discourse.nixos.org/t/builder-for-nvidia-x11-550-78-6-10-drv-failed-with-exit-code-2/49360/
  };
}
