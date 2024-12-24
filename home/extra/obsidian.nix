{ pkgs, ... }:
let
  minutes = "15";
  scheduleExpression = "*:0/${minutes}";
  gitSyncObsidian = pkgs.writeScriptBin "git-sync-obsidian-service" ''
    #!/usr/bin/env bash

    VAULT_DIRECTORY="$HOME/Documents/Notes"
    pushd $VAULT_DIRECTORY
    git add .
    git commit -m "$(date '+%Y-%m-%d %H:%M:%S')" || exit 0
    popd

  '';
in
{
  home.packages = with pkgs; [
    obsidian
    gitSyncObsidian
  ];

  # Declaration of a systemd service
  systemd.user.services.git-sync-obsidian = {
    Unit = {
      Description = "Sync Obsifdian Vault to private GitHub Repository";
      Wants = "git-sync-obsidian.timer";
    };
    Service = {
      ExecStart = "${gitSyncObsidian}/bin/git-sync-obsidian-service";
      Type = "simple";
    };
  };

  systemd.user.timers.git-sync-obsidian = {
    Unit = {
      Description = "Run Git Sync for Obsidian Vault every";
    };
    Timer = {
      OnCalendar = "${scheduleExpression}";
    };
    Install = {
      WantedBy = [ "timers.target" ];
    };
  };

}
