{...}:

{
  programs.git = {
    enable = true;
    userName = "Asterikss";
    userEmail = "AndreAndreM@proton.me";
    lfs = { enable = true; };
    ignores = [
      ".dev/"
    ];
    extraConfig = {
      init = { defaultBranch = "master"; };
      pull = { rebase = true; };
      push = { autoSetupRemote = true; };
      # merge = { conflictstyle = "diff3"; };
    };
  };
}
