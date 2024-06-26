on run argv

    if argv is {} then
        set queryStr to ""
    else
        set argItem to item 1 of argv
        set regex to "(^/Users/.*|^$)"
        set result to do shell script "echo " & quoted form of argItem & " | grep -E " & quoted form of regex
        -- log result
        log result
        if result is not "" then
            set queryStr to ""
        else
            set queryStr to argItem
        end if
    end if

    tell application "Notes"
        activate
        reopen -- force reopen
    end tell

    tell application "System Events"
        tell process "Notes"
            set frontmost to true
            keystroke "f" using {command down, option down}
            delay 0.2
            keystroke "a" using {command down}
            delay 0.1
            do shell script "echo " & quoted form of queryStr & " | tr -d '\n' | pbcopy"
            keystroke "v" using {command down}
            keystroke return
        end tell
    end tell

end run