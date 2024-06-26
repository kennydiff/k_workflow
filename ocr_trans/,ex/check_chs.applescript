set queryStr to "hello 中 world"

-- 检查是否包含中文字符
set hasChinese to do shell script "python3 /Users/ken/Sync/ws/2.Script/k_workflow/ocr_trans/check_chs.py " & quoted form of queryStr
if hasChinese is "True" then
	-- queryStr 包含中文字符
	display dialog "The string contains Chinese characters."
else
	display dialog "The string does not contain Chinese characters."
end if

(* set myString to "Hello, world 1234!"
set hasNumber to do shell script "echo " & quoted form of myString & " | grep -q '[0-9]' && echo yes || echo no"
if hasNumber is "yes" then
	display dialog "The string contains a number."
else
	display dialog "The string does not contain a number."
end if *)

(* set queryStr to " cool baby ! "
-- if queryStr contains "[[:punct:][:space:]]" then
if queryStr contains "[:space:]" then
	-- log queryStr
	log "appName  ...  OpenAI Translator"
	return "OpenAI Translator"
else
	-- log queryStr
	log "appName  ...  Dictionary"
	return "Dictionary"
end if *)