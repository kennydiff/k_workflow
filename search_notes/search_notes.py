import subprocess
# import time
# import re
import sys
import os

def main(argv):
    if not argv:
        query_str = ""
    else:
        arg_item = argv[0]
        regex = r"(^/Users/.*)" # K_24606 判断是否匹配 → `/Users/`开头 的正则表达式

        cmd = f"echo '{arg_item}' | grep -E '{regex}'"
        process = subprocess.run(cmd, capture_output=True, text=True, shell=True, executable="/bin/zsh")
        print(process.returncode)

        # K_24606 这里逻辑反了， process.returncode 为0 则表示正则表达式匹配到了, 为1 是不匹配
        
        # 定义一个逻辑变量，表示是否匹配到了正则表达式
        is_reg_matched = False

        if process.returncode != 0:
            is_reg_matched = True
        
        if is_reg_matched:
            query_str = arg_item
        else:
            query_str = ""

    os.system("open -a Notes")
    # time.sleep(0.1)  # wait for the app to open

    if query_str != "":
        # Use osascript to send keyboard shortcuts
        os.system("""
            osascript -e 'tell application "System Events" to keystroke "f" using {command down, option down}'
        """)
        # time.sleep(0.1)
        os.system("""
            osascript -e 'tell application "System Events" to keystroke "a" using command down'
        """)
        # time.sleep(0.1)

        subprocess.run('echo ' + query_str + ' | tr -d \'\n\' | pbcopy', shell=True)

        # Use osascript to paste the clipboard content and press return
        os.system("""
            osascript -e 'tell application "System Events" to keystroke "v" using command down'
            osascript -e 'tell application "System Events" to keystroke return'
        """)

if __name__ == "__main__":
    main(sys.argv[1:])