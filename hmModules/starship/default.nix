{ ... }:

{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      cmd_duration.disabled = true;
      package.disabled = true;
      character.success_symbol = "[󰈺 ](#7B68F5)";
      character.error_symbol = "[󰈺 ](#A39475)";
    };
  };
}
