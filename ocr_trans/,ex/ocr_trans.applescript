on preprocess(queryStr)
	log "AFTER: " & queryStr
	-- if queryStr contains "[\u4e00-\u9fa5]" then
	--  return "OpenAI Translator"
	
	-- if queryStr contains "[[:punct:][:space:]]" then
	
	if queryStr contains " " then
		-- log queryStr
		-- log "appName  ...  OpenAI Translator"
		return "OpenAI Translator"
	else
		log queryStr
		log "appName  ...  Dictionary"
		return "Dictionary"
	end if
end preprocess

on run argv
	if argv is {} then
		set queryStr to ""
	else
		set queryStr to item 1 of argv
		set queryStr to do shell script "echo " & quoted form of queryStr & " | sed 's/^[[:punct:][:space:]]*//;s/[[:punct:][:space:]]*$//'"
	end if
	
	set appName to preprocess(queryStr)
	
	set b_app_running to false -- 判断app是否已在运行
	
	tell application "System Events"
		if exists (processes where name is appName) then
			set b_app_running to true
		end if
	end tell
	
	if not b_app_running then
		tell application appName
			activate
			-- reopen
			-- launch
			-- log appName & " activating"
			-- reopen
			if appName = "OpenAI Translator" then
				-- 这里`OpenAI Translator` 是所谓的rust应用, 却打开很慢，至少需要delay 0.3~0.4 秒, 否则会无法启动完整，执行后面的粘贴逻辑
				delay 0.4
			end if
		end tell
	end if
	
	tell application "System Events"
		tell process appName
			-- set visible to true
			set frontmost to true
			delay 0.1
			
			if appName = "Dictionary" then
				keystroke "f" using {command down, option down}
				delay 0.1
			end if
			
			keystroke "a" using {command down}
			do shell script "echo " & quoted form of queryStr & " | tr -d '
' | pbcopy"
			keystroke "v" using {command down}
			keystroke return
			
			if appName = "Dictionary" then
				delay 0.1
				keystroke tab using {shift down}
			end if
		end tell
	end tell
end run