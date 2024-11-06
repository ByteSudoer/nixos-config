_: {

  #Configure Starship
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
        format = "$symbol ";
        vicmd_symbol = "[❮](bold green)";
        disabled = false;
        success_symbol = "[➜](bold green) ";
        error_symbol = "[✗](bold red) ";
      };
      cmd_duration = {
        min_time = 2000;
        format = "⏱ [$duration]($style) ";
        style = "yellow bold";
        show_milliseconds = false;
        disabled = false;
        show_notifications = false;
        min_time_to_notify = 45000;
      };
      directory = {
        disabled = false;
        fish_style_pwd_dir_length = 0;
        format = "[$path]($style)[$lock_symbol]($lock_style) ";
        home_symbol = "~";
        read_only_style = "red";
        repo_root_format = "[$before_root_path]($style)[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
        style = "cyan bold bg:0xDA627D";
        truncate_to_repo = true;
        truncation_length = 5;
        truncation_symbol = "…/";
        use_logical_path = true;
        use_os_path_sep = true;
        substitutions = {
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";

        };
      };
      hostname = {
        ssh_only = false;
        format = "[$ssh_symbol](blue dimmed bold)[$hostname]($style) ";
        trim_at = ".";
        disabled = false;
      };
      username = {
        style_user = "bold dimmed blue";
        disabled = false;
        show_always = true;
      };
      package = {
        disabled = true;
      };
      line_break = {
        disabled = false;
      };

    };

  };
}
