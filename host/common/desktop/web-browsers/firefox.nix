{
  pkgs,
  desktop,
  extra,
  lib,
  hostname,
  ...
}:
let
  isDesktop = builtins.isString desktop;
  isExtra = builtins.isString extra;
  isInList = element: list: builtins.elem element list;
  hostnames = [
    "vm"
    "e16-nixos"
  ];
in
{
  programs.firefox = {
    package = pkgs.firefox;
    enable = isDesktop;
    languagePacks = [
      "en-GB"
      "en-US"
    ] ++ lib.optional isExtra "fr";
    preferences = {
      "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
      "browser.crashReports.unsubmittedCheck.enabled" = false;
      "browser.fixup.dns_first_for_single_words" = false;
      "browser.newtab.extensionControlled" = true;
      "browser.search.update" = true;
      "browser.tabs.crashReporting.sendReport" = false;
      "browser.urlbar.suggest.bookmark" = false;
      "browser.urlbar.suggest.history" = true;
      "browser.urlbar.suggest.openpage" = false;
      "browser.tabs.warnOnClose" = false;
      "browser.urlbar.update2.engineAliasRefresh" = true;
      "datareporting.policy.dataSubmissionPolicyBypassNotification" = true;
      "dom.disable_window_flip" = true;
      "dom.disable_window_move_resize" = false;
      "dom.event.contextmenu.enabled" = true;
      "dom.reporting.crash.enabled" = false;
      "extensions.getAddons.showPane" = false;
      "media.gmp-gmpopenh264.enabled" = true;
      "media.gmp-widevinecdm.enabled" = true;
      "places.history.enabled" = true;
      "security.ssl.errorReporting.enabled" = false;
      "widget.use-xdg-desktop-portal.file-picker" = 1;
    };
    preferencesStatus = "default";
    policies = lib.mkIf (isInList hostname hostnames) {
      "Homepage" = {
        "URL" = "https://duckduckgo.com/";
      };
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "CaptivePortal" = true;
      "Cookies" = {
        "AcceptThirdParty" = "from-visited";
        "Behavior" = "reject-tracker";
        "BehaviorPrivateBrowsing" = "reject-tracker";
        "RejectTracker" = true;
      };
      #Configure tracking protection
      "EnableTrackingProtection" = {
        "Value" = true;
        #whether or not a user can change it.
        "Locked" = false;
        "Cryptomining" = true;
        "EmailTracking" = true;
        "Fingerprinting" = true;
      };
      "HardwareAcceleration" = true;

      "NewTabPage" = true;
      "NoDefaultBookmarks" = true;
      "SearchEngines" = {
        "Default" = "DuckDuckGo";
        "DefaultPrivate" = "DuckDuckGo";
        "Remove" = [
          "Bing"
          "eBay"
          "Google"
        ];
      };
    };
  };
}
