#!/bin/bash

BOOKMARKS_FILE="$HOME/dotfiles/scripts/bookmarks.txt"

# Ensure the file exists
touch "$BOOKMARKS_FILE"

case "$1" in
    "add")
        # Get URL from clipboard
        URL=$(xclip -o -selection clipboard)

        # Ensure clipboard contains a valid URL
        if [[ -z "$URL" ]]; then
            notify-send "Bookmark Manager" "No URL found in clipboard!"
            exit 1
        fi

        echo "$URL" >> "$BOOKMARKS_FILE"
        notify-send "Bookmark Manager" "Added: $URL"
        ;;
    
    "open")
        # Select a bookmark via dmenu and open it
        CHOSEN=$(cat "$BOOKMARKS_FILE" | dmenu -i -l 10)
        
        if [[ -n "$CHOSEN" ]]; then
            xdg-open "$CHOSEN"
        fi
        ;;
    
    "remove")
        # Select a bookmark from dmenu to remove
        CHOSEN=$(cat "$BOOKMARKS_FILE" | dmenu -i -l 10)

        if [[ -n "$CHOSEN" ]]; then
            grep -vF "$CHOSEN" "$BOOKMARKS_FILE" > "$BOOKMARKS_FILE.tmp" && mv "$BOOKMARKS_FILE.tmp" "$BOOKMARKS_FILE"
            notify-send "Bookmark Manager" "Removed: $CHOSEN"
        fi
        ;;
    
    *)
        notify-send "Bookmark Manager" "Usage: bookmark-manager.sh {add|open|remove}"
        ;;
esac
