on run argv
    if argv is {} then
        set queryStr to ""
    else
        set queryStr to item 1 of argv
    end if

    tell application "Dictionary"
        activate
		reopen
    end tell

    tell application "System Events"
        tell process "Dictionary"
            set frontmost to true        
            keystroke "f" using {command down, option down}
            delay 0.1
            keystroke "a" using {command down}
            delay 0.1
            -- K_24603 org_bk do shell script "echo " & quoted form of queryStr & " | tr -d '\n' | pbcopy"
            -- K_24603 将字符串的前后所有非26英文字母(大小写都属于字母)的字符都删掉，比如空格，标点符号，数字等。
            -- K_24603 从左到右第一个都删除，直到遇到第一个英文字母；从右到左也是这样的规则。
            do shell script "echo " & quoted form of queryStr & " | sed 's/^[^a-zA-Z]*//;s/[^a-zA-Z]*$//' | tr -d '\n' | pbcopy"
            keystroke "v" using {command down}
            keystroke return
            delay 0.1
            keystroke tab using {shift down}
        end tell
    end tell
end run