#!/usr/bin/env bash

dunstctl history \
    | jq -r '.data[] | .[] | select(.key == "summary") | .value.data'
