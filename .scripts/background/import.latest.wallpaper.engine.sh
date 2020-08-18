#!/bin/bash

video=$(find ~/.steam/steam/steamapps/workshop/content/431960/ -type f -name "*.mp4" -printf "%T@ %p\n" | sort -nr | head -n1 | awk '{sub($1 OFS, ""); print $0}')
video_name=$(basename "$video")
import=0
name=""
import_dir=~/cloud/wall/vid/
destination=$import_dir


# Play video
echo "Playing: $video_name"
mpv -fs --loop "$video" > /dev/null 2>&1

# Ask for import
read -p "Do you wish to import this wallpaper? (y/n): " choice
case $choice in
	[Yy]* ) import=1;;
	* ) echo "Bye."; exit;;
esac

# Make sure wallpaper does not exist
if [ -f "$destination$video_name" ]; then
	echo "WARNING: A wallpaper of the same name exists!"
fi

# Ask for rename
read -p "Rename? (optional): " name
if [ ! -z $name ]; then
	if [ -f "$destination$name" ]; then
		echo "ERROR: A wallpaper of the same name exists!"
		exit 1
	fi

	destination="$destination$name"
fi

# Import
echo "Importing.."
echo " - video: $video_name"
echo " -  dest: $destination"

cp "$video" "$destination"

