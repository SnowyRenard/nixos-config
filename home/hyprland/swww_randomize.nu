#!/bin/nu
#
# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals

def main [dir: path, time: int] {
  loop {
    if (ps | select name | find  wineserver ffxiv_dx11.exe | is-empty) and (hyprctl clients -j | from json | get fullscreen | all {$in == 0}) { # Check if certain processes are running. To add to this list just add the name after find.
      let file = (select_file $dir) 

      update_colors ($file.name | get 0 )
    }

  sleep ($time | into duration --unit sec) # Because the input is currently an integer conversion is required
  }
}


# Update the environment based upon the path to an image
def update_colors [img: path] {  
  [
    (killall waybar | ignore ; ~/.dotfiles/nushell/.config/nushell/launch waybar | ignore ), # Cause waybar keeps control over the process launch it in a child process through sh
    (wallust run $img --quiet -s -d ~/.config/wallust | ignore),
    (magick $img -gravity Center -extent 1.005:1 ~/.cache/rofi.bmp),
    (swww img $img),
  ] | par-each { $in }
}

# Select a random file within a directory
def select_file [dir: path] {
  
  let input_dir = ($"($dir)/**/*" | into glob) # glob is required to format because magic?

  let files = ls $input_dir | where type == file # Get all the eligible files

  let index = random int ..($files | length) # Select a random number

  $files | select $index # Return the actual file
}
