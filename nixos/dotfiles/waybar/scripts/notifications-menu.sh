#!/usr/bin/env bash

get_history() {
    dunstctl history | jq -r '
        .data[0][] |
        [
            .id.data,
            .summary.data,
            .body.data,
            .appname.data
        ] | @tsv
    '
}

while true; do
    TMP=$(mktemp)

    get_history | while IFS=$'\t' read -r id summary body app; do
        printf '%s\t%s\t%s\n' "$id" "$summary" "$body"
    done > "$TMP"

    printf '󰆴\tDELETE_ALL\t\n' >> "$TMP"

    CHOICE=$(cut -f2- "$TMP" | while IFS=$'\t' read -r summary body; do
        if [ "$summary" = "DELETE_ALL" ]; then
            printf '󰆴  Delete all\n'
        else
            printf '󰂚  %s — %s\n' "$summary" "$body"
        fi
    done | fuzzel --dmenu --prompt "󰂚  Notifications  ")

    [ -z "$CHOICE" ] && rm "$TMP" && exit 0

    if [[ "$CHOICE" == *"Delete all"* ]]; then
        rm "$TMP"

        CONFIRM=$(printf 'No\nYes\n' | fuzzel --dmenu --prompt "󰆴  Delete all notifications? ")

        if [ "$CONFIRM" = "Yes" ]; then
            dunstctl history-clear
        fi

        exit 0
    fi

    ID=$(grep -F "$(echo "$CHOICE" | sed 's/^󰂚  //')" "$TMP" | cut -f1 | head -n1)

    rm "$TMP"

    [ -z "$ID" ] && exit 0

    # Notification wieder anzeigen
    dunstctl history-pop "$ID"

done
