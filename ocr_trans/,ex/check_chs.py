# check_chinese.py
import sys
import re

def contains_chinese(s):
    return re.search('[\u4e00-\u9fff]', s) is not None

if __name__ == "__main__":
    print(contains_chinese(sys.argv[1]))