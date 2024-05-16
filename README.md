---
English | [中文](./README_ZH.md)
---


# kenny_alfred_workflow

🌈These three are the alfred_workflows that I frequently use and have modified. They can help me, and perhaps they can help others as well, Hope you will like it ~~~ 🍺🌸🦀



## ⚙️code_iterm (AppleScript)

While opening VSCode, additional features have been added that allow iTerm to open the selected subfolder or the current folder location simultaneously for convenient debugging, eliminating the need to use shift+cmd+c to open an external terminal within VSCode. AppleScript can be edited and debugged using the "Script Editor," which is more user-friendly than debugging in Alfred.An Alfred 4 workflow for opening files or folders with Visual Studio Code. Based off of the Alfred 2 workflow from @franzheidl.

- #### Functions

- [x] Open VSCode and simultaneously open the selected subfolder or the current folder location in iTerm

- [x] Bind the hotkey "HyperKey + E" in Alfred, and in Manico, bind the hotkey for VSCode as "Option + E"

## ⚙️finder_iterm (AppleScript)

From Finder's current or selected folder → Quick Open in iTerm

- #### Functions

- [x] If no subfolder is selected or the selected item is not a folder, then open the current folder in iTerm.
- [x] If a subfolder is selected, open the selected subfolder in iTerm.
- [x] If multiple files/folders are selected, take the first folder and open it in iTerm.
- [x] If Finder is not open, open the default folder → Downloads.
- [x] Bind the hotkey "Option + `" in Alfred, which only recognizes the folder selection situation in Finder when there is no iTerm process, and in other cases, it activates the iTerm window.

## ⚙️hex_month_date (Python)

An Alfred Snippet Trigger that expresses dates within the next 100 years using a five-digit combination of year, month, and day, primarily modifying the representation of the month to hexadecimal, which saves one digit. The year is shortened by removing the initial '20' prefix, saving two digits. This way, a five-digit format can replace the previous eight-digit year.

```shell
type `sd or `hd or `ud to paste a short COMMENT like:  # K_22A09 (2022-10-09）
```

- #### Functions

- [x] Remove the dependency of this component: 'pyperclip'
- [x] type `sd → // K_22710 Slash
- [x] type `hd → # K_22710 Hashtag
- [x] type `ud → _22710 Underline
- [x] Defect Fix: The content in the clipboard was overwritten in ken_5-digit date, it should be temporarily stored first, then paste.

