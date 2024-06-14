import sys
import re
import subprocess
import time
import os
import string


def contains_chinese(s):
    return re.search('[\u4e00-\u9fff]', s) is not None

def preprocess(query_str):
    contains_punctuation = any(char in string.punctuation for char in query_str)
    if contains_chinese(query_str) or (" " in query_str) or contains_punctuation:
        return "OpenAI Translator"
    else:
        return "Dictionary"

def is_process_running(name):
    call = f"pgrep -f '{name}.app'"
    try:
        output = subprocess.check_output(call, shell=True)        
        if output.strip():
            return True
        else:
            return False
    except subprocess.CalledProcessError:
        return False

def main(argv):
    # short_query_str = ""  # K_24606 初始化
    # query_str = ""
    if argv:
        full_query_str = argv[0]
        
        # K_24610 先将所有的 `\n`(换行) 替换成空格
        short_query_str = re.sub(r'\n', ' ', full_query_str)
        # K_24605 通过正则表达式去除字符串左右两端的空格和标点符号
        short_query_str = re.sub(r'^[\W\s]+|[\W\s]+$', '', short_query_str)
        safe_query_str = short_query_str.replace("'", "'\\''")
    else:
        return  # K_24605 如果没有输入参数，则直接返回

    app_name = preprocess(safe_query_str)

    is_dictionary = app_name == "Dictionary"  # K_24606 判断是否是`词典`应用

    if not is_process_running(app_name):
        # print(app_name)
        app_path = f"open -a '{app_name}'" 
        os.system(app_path)
        if not is_dictionary:
            time.sleep(0.5)

    # 将{app_name}这个应用程序置于前台
    os.system(f"osascript -e 'tell application \"{app_name}\" to activate'")


    if is_dictionary: 
        # K_24610 模拟`macOS`的`command + option + f` 调出查询框(这个动作会自动全选的)
        os.system("osascript -e 'tell application \"System Events\" to keystroke \"f\" using {command down, option down}'")
    else :           
        # `OpenAI Translator` 需要模拟全选的动作
        os.system("osascript -e 'tell application \"System Events\" to keystroke \"a\" using command down'")

    os.system(f"echo '{safe_query_str}' | tr -d '\n'| pbcopy")
    time.sleep(0.1)

    # print(safe_query_str)
    os.system("osascript -e 'tell application \"System Events\" to keystroke \"v\" using command down'")
    time.sleep(0.1)
    
    # 模拟回车
    os.system("osascript -e 'tell application \"System Events\" to keystroke return'")
    
    # if is_dictionary:   # 如果应用是 `词典`, 还要模拟 shift + tab (在`macOS13`会导致词典的焦点诡异,无法响应退出热键)
        # os.system("osascript -e 'tell application \"System Events\" to keystroke tab using shift down'")

if __name__ == "__main__":
    main(sys.argv[1:])
