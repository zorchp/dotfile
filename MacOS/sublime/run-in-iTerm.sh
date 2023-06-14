#!/bin/bash

osascript - "$@" <<EOF
on run argv
    tell application "iTerm"
        if (window count) is equal to 0 then
            reopen
        end if
        tell current session of current window
            repeat with arg in argv
                write text arg
            end repeat
        end tell
    end tell
end run
EOF
