{ pkgs, colorscheme, ... }:
let
  themeConfig =
    if colorscheme == "dracula" then
      {
        activeBorderColor = [
          "#FF79C6"
          "bold"
        ];
        inactiveBorderColor = [
          "#BD93F9"
        ];
        searchingActiveBorderColor = [
          "#8BE9FD"
          "bold"
        ];
        optionsTextColor = [
          "#6272A4"
        ];
        selectedLineBgColor = [
          "#6272A4"
        ];
        inactiveViewSelectedLineBgColor = [
          "bold"
        ];
        cherryPickedCommitFgColor = [
          "#6272A4"
        ];
        cherryPickedCommitBgColor = [
          "#8BE9FD"
        ];
        markedBaseCommitFgColor = [
          "#8BE9FD"
        ];
        markedBaseCommitBgColor = [
          "#F1FA8C"
        ];
        unstagedChangesColor = [
          "#FF5555"
        ];
        defaultFgColor = [
          "#F8F8F2"
        ];
      }
    else
      {

      };

in
{
  programs.lazygit = {
    enable = true;
    package = pkgs.lazygit;
    settings = {
      gui = {
        theme = themeConfig;
      };
      git = {
        paging = {
          colorOrg = "always";
          useConfig = false;
        };
        merging = {
          manualCommit = true;
          squashMergeMessage = "Squash merge {{selectedRef}} into {{currentBranch}}";
          mainBranches = [
            "main"
            "master"
          ];
        };

      };

    };
  };
}
