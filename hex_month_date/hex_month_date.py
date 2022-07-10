import datetime 

# K_22619 返回一个类似这样的5位日期: 22B19(2022年11月19日) 中间的月份时16进制的月份 可以节约1位位数
def get_5bit_date():
    today = datetime.date.today()
    str_year = today.strftime('%y')
    str_day = today.strftime('%d')
    hex_month = hex(today.month).upper()[-1]
    # print(str_year + hex_month + str_day)
    return str_year + hex_month + str_day