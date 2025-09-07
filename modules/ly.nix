{ ... }:

{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "matrix";
      asterisk = "!";
      clear_password = true;
      blank_box = true;
      hide_borders = false;
      hide_version_string = true;
      hide_key_hints = true;
      session_log = ".ly-session.log";
    };
  };
}
