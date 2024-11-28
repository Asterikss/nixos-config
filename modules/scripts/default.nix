{...}:

{
  home.file.".config/scripts/screenshots.sh" = {
    source = ./screenshots.sh;
    executable = true;
  };

  home.file.".config/scripts/wall.sh" = {
    text = ''
      #!/usr/bin/env bash

      WK_FILE="$HOME/.config/.wk"

      if [ ! -f "$WK_FILE" ] ; then
        image_dir="$HOME/Downloads"

        if [ ! -d "$image_dir" ]; then
          echo "directory $image_dir does not exist. exiting."
          exit 1
        fi

        random_image=$(find "$image_dir" -type f | shuf -n 1)

        if [ -z "$random_image" ]; then
          echo "no files found in $image_dir. exiting."
          exit 1
        fi

        swww img "$random_image"
      fi
    '';
    executable = true;
  };
}
