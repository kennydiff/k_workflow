# kenny_alfred_workflow

🌈这三个是我常用并且MOD过的 alfred_workflow ，它们能帮到我自己，也许能帮到其他人， Hope you will like it ~~~ 🍺🌸🦀



## ⚙️code_iterm (AppleScript)

打开VSCode的同时，添加了 额外的功能，可同时将所选的子文件夹/当前文件夹位置的iTerm同时打开方便调试,省去了在vscode里再shift+cmd+c打开外部终端的步骤。  AppleScript可用"脚本编辑器"编辑调试,比在Alfred调试友好。
An Alfred 4 workflow for opening files or folders with Visual Studio Code. Based off of the Alfred 2 workflow from @franzheidl.

- #### 功能

- [x] 打开VSCode的同时，同时将所选的子文件夹/当前文件夹位置的iTerm同时打开
- [x] 在Alfred里绑定热键 "HyperKey +  E"，在Manico里绑定VSCode的热键是 "⌥ + E"

## ⚙️finder_iterm (AppleScript)

从Finder的当前或选择的文件夹 → iTerm的快速打开

- #### 功能

- [x] 没有选择子文件夹 or 选择的不是文件夹，则在iTerm里打开当前文件夹
- [x] 选择了子文件夹，在iTerm里打开选择的子文件夹
- [x] 选择了多个文件/文件夹，则取第一个文件夹，在iTerm里打开
- [x] 没开Finder的话，打开默认文件夹 → Downloads
- [x] 在Alfred里绑定热键 "⌥ +  `"，只对无iTerm进程时识别Finder的文件夹选择情况，其他情况下将iTerm窗体激活

## ⚙️hex_month_date (Python)

用五位的年月日来表达未来100年内的日期的一款Alfred Snippet Trigger， 主要是对月份的修改，改为16进制表达，这样可节省一位，年份去掉之前的20这个前缀，可省2位，这样就可用5位替代之前的8位年份。

```shell
type `sd or `hd or `ud to paste a short COMMENT like:  # K_22A09 (2022-10-09）
```

- #### 功能

- [x] 去掉这个组件的依赖：'pyperclip'
- [x] type `sd → // K_22710 Slash
- [x] type `hd → # K_22710 Hashtag
- [x] type `ud → _22710 Underline
- [x] 缺陷Fix： ken_5位年月日里面剪贴板的内容被覆盖了， 应该先临时存，然后再paste



