{ config, pkgs, lib, ... }:
{
    targets.genericLinux.enable = true;
    systemd.user = {
        systemctlPath = "/usr/bin/systemctl";
    };
}
