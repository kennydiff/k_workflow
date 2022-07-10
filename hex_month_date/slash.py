# import pyperclip  # K_22702 import 这个组件可以控制 macOS 的剪贴板， 改用 print 可以不必依赖 pyperclip 了
import hex_month_date

print('// K_' + hex_month_date.get_5bit_date() , end=' ')  # K_22622 往剪贴板放进字符串