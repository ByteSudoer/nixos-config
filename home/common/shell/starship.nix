_:
{

  #Configure Starship
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red) ";
      };
      directory = {
        truncation_length = 5;
        format = "[$path]($style)[$lock_symbol]($lock_style) ";
      };
      username = {

        style_user = "bold dimmed blue";
        disabled = false;
        show_always = true;
      };
      cmd_duration = { format = " took [$duration](bold yellow)"; };
      package = { disabled = true; };
      line_break = { disabled = false; };

    };

  };
}
