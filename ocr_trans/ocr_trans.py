import sys
import re
import subprocess
import time
import os
import string


def contains_chinese(s):
    # print(re.search('[\u4e00-\u9fff]', s))
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
    if not argv:
        query_str = ""
    else:
        query_str = argv[0]
        # K_24605 通过正则表达式去除字符串左右两端的空格和标点符号
        short_query_str = re.sub(r'^[\W\s]+|[\W\s]+$', '', query_str)

    app_name = preprocess(short_query_str)

    if not is_process_running(app_name):
        print(app_name)
        app_path = f"open -a '{app_name}'" 
        os.system(app_path)
        if app_name == "OpenAI Translator":
            time.sleep(0.4)

    # 将{app_name}这个应用程序置于前台
    os.system(f"osascript -e 'tell application \"{app_name}\" to activate'")
    
    #模拟全选的动作
    os.system("osascript -e 'tell application \"System Events\" to keystroke \"a\" using command down'")
    
    if app_name == "Dictionary": # K_24605 如果是词典应用，则使用前后去除杂符号的字符串; "OpenAI Translator"则不需要预处理
        query_str = short_query_str

    # 模拟粘贴动作,将`query_str`的内容粘贴进去当前焦点框    
    os.system(f"echo '{query_str}' | tr -d '\n' | pbcopy")
    time.sleep(0.1)
    os.system("osascript -e 'tell application \"System Events\" to keystroke \"v\" using command down'")
    time.sleep(0.1)
    
    # 模拟回车
    os.system("osascript -e 'tell application \"System Events\" to keystroke return'")

if __name__ == "__main__":
    main(sys.argv[1:])
