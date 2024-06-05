set theTarget to ""
-- set defaultTarget to (path to home folder as alias)
-- comment line above and uncomment line below to open desktop instead of user home when there's no selection or open folder in the Finder:
-- set appPath to path to application "iTerm"

tell application "System Events"
	-- some versions might identify as "iTerm2" instead of "iTerm"
	set isRunning to (exists (processes where name is "iTerm")) or (exists (processes where name is "iTerm2"))
	if isRunning is true then
		tell application "iTerm"
			activate
		end tell
		error number -128 -- 用户退出程序
	end if
end tell

tell application "Finder"
	
	-- display alert defaultTarget
	-- set defaultTarget to (path to desktop folder as alias)
	try
		set theTarget to (folder of the front window as alias)
		
	on error
		set theTarget to (path to downloads folder as alias)
		if isRunning is false then
			tell application "iTerm"
				activate
			end tell
		end if
	end try
	
	repeat with currItem in (get selection)
		if (class of currItem) as string = "folder" then
			set theTarget to currItem
			exit repeat
		end if
	end repeat
	
	set pathList to (quoted form of POSIX path of (theTarget as alias))
	set command to "clear; cd " & pathList
	
end tell


tell application "iTerm"
	if isRunning is false then
		create tab with default profile
		delay 0.01 -- 这里必须要delay 否则容易出些傻逼找不到窗体的错误~~~
		activate
	end if
	
	set hasNoWindows to ((count of windows) is 0)
	-- select first window  # 这句不是必须的
	tell the first window
		if isRunning and hasNoWindows is false then
			create tab with default profile
		end if
		tell current session to write text command
	end tell
end tell