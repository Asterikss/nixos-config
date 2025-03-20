{...}:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      cmd_duration.disabled = true;
      # conda = {
      #   disabled = false;
      #   ignore_base = true;
      #   format = "[$symbol$environment](dimmed green) "
      # }
      # aws.disabled = true;
      # gcloud.disabled = true;
    };
  };
}
