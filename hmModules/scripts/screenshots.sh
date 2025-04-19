#!/usr/bin/env bash

# Flags:

# r: region
# s: screen
#
# c: clipboard
# f: file
# i: interactive

# p: pixel

rename_screenshot() {
  local default_filename=$1

  new_filename=$(rofi -theme purple -dmenu -p "Filename" -theme-str 'window {width: 20%; height: 3%; padding: 5px;} listview {lines: 1;}')

  if [[ -n "$new_filename" ]]; then
    local new_filepath=~/cave/pics/screenshots/"$new_filename".png
    while [[ -e "$new_filepath" ]]; do
      notify-send "Error" "File already exists. Please choose a different name."
      new_filename=$(rofi -theme purple -dmenu -p "File exists. Filename" -theme-str 'window {width: 30%; height: 3%; padding: 5px;} listview {lines: 1;}')
      if [[ -z "$new_filename" ]]; then
        notify-send "Cancelled" "Keeping default filename: $default_filename"
        return
      fi
      new_filepath=~/cave/pics/screenshots/"$new_filename".png
    done
    mv "$default_filename" "$new_filepath"
    notify-send 'Screenshot Renamed' "$new_filepath"
  else
    notify-send "Screenshot Saved" "Kept default filename: $default_filename"
  fi
}

if [[ $1 == rc ]]; then
  grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | wl-copy
  notify-send 'Copied to Clipboard' Screenshot


elif [[ $1 == rf ]]; then
  mkdir -p ~/cave/pixels/screenshots
  filename=~/cave/pixels/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png

  grim -g "$(slurp -b '#000000b0' -c '#00000000')" "$filename"
  notify-send 'Screenshot Taken' "$filename"

  rename_screenshot "$filename"


elif [[ $1 == ri ]]; then
  grim -g "$(slurp -b '#000000b0' -c '#00000000')" - | swappy -f -


elif [[ $1 == sc ]]; then
  grim - | wl-copy
  notify-send 'Copied to Clipboard' Screenshot


elif [[ $1 == sf ]]; then
  mkdir -p ~/cave/pixels/screenshots
  filename=~/cave/pixels/screenshots/$(date +%Y-%m-%d_%H-%M-%S).png

  grim "$filename"
  notify-send 'Screenshot Taken' "$filename"

  rename_screenshot "$filename"


elif [[ $1 == si ]]; then
  grim - | swappy -f -


elif [[ $1 == p ]]; then
  color=$(hyprpicker -a)
  wl-copy "$color"
  notify-send 'Copied to Clipboard' "$color"
fi
