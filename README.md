---
English | [中文](./README_ZH.md)
---


# kenny_alfred_workflow

🌈These are the alfred workflows that I frequently use and have modified. They can help me, and perhaps they can help others as well, Hope you will like it ~~~ 🍺🌸🦀



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

## ⚙️new_file (shell)

The workflow allows you to quickly create new files in the Finder. If the post-haste behavior is enabled, new files are created the same way as folders are when you use the shortcut (default: ^⌥⇧⌘ + N). Otherwise you will be prompted with the input mask where you can configure the file name and type.
The workflow will pick up on your location in the Finder and create the new file there. If you use the keyword, the most recently used Finder window will be selected as the destination. If no Finder window is currently open, the file will be created in the configurable fallback location.

Forked from this project [New File](https://github.com/zeitlings/alfred-workflows?tab=readme-ov-file#18-new-file), some minor issues were fixed.

- [x] When there is no Finder window, it can cause errors in the generated files.
- [x] Some unnecessary processing was done when pasting text, such as automatically escaping characters like `\n`.

Creating a new file.
- [x] ⌘ to view the full path to the target folder.
- [x] ↩ to create the file with configured settings.
- [x] ⌘⇧↩ to create the file with clipboard contents.
- [x] ⌥⇧↩ to create the file without clipboard contents.
- [x] If auto-suggest is enabled, press TAB to accept and expand the suggested filename.

## ⚙️ocr_trans (Python & Swift)

Use `OCR` or `Select Text` to invoke the macOS system's `Dictionary` app for word lookup. If a single word is selected, invoke the `Dictionary` app for word lookup (high efficiency). If multiple words are selected or if it's Chinese, invoke `OpenAI Translator` for translation.
- Default shortcut:  **Ctrl+Alt+Shift+Cmd+D** | **Ctrl+Alt+Shift+Cmd+F**
- Default keyword:  `tr` (TR)anslate  |  `ot` (O)CR & (T)ranslate

### Configuration
**Languages:** Specify the languages you want the OCR process to consider by adding the appropriate *RFC-5646 language tag*. The following languages (and regions) are currently supported:
`en-US`, `fr-FR`, `it-IT`, `de-DE`, `es-ES`, `pt-BR`, `zh-Hans`, `zh-Hant`, `yue-Hans`, `yue-Hant`, `ko-KR`, `ja-JA`, `ru-RU`, `uk-UA`  

**Explanations:**
- `en-US`: (English as used in the United States)
- `de-DE`: (German as used in Germany)
- `fr-FR`: (French as used in France)
- `it-IT`: (Italian as used in Italy)
- `es-ES`: (Spanish as used in Spain)
- `pt-BR`: (Portuguese as used in Brazil)
- `ko-KR`: (Korean as used in South Korea)
- `uk-UA`: (Ukrainian as used in Ukraine)
- `ja-JA`: (Japanese as used in Japan)
- `ru-RU`: (Russian as used in Russia)
- `yue-Hant`: (Traditional Cantonese)
- `yue-Hans`: (Simplified Cantonese)
- `zh-Hant`: (Traditional Chinese)
- `zh-Hans`: (Simplified Chinese)

### Dictionary Instructions
- Recommend using the [Longman Dictionary of Contemporary English](https://www.v2ex.com/t/907272) for its detailed word explanations, examples, and demonstration pronunciations in both British and American English. 
- It works best when paired with my revised `DefaultStyle.css` to replace the default layout file(Need to install the [Lxgw WenKai](https://github.com/lxgw/LxgwWenKai) font.), which enhances the display effect, especially the pop-up translation effect when using `three-finger touch` | (`⌘+⌃+D`).

```shell
brew tap homebrew/cask-fonts && brew install font-lxgw-wenkai
```

## ⚙️search_notes (AppleScript)

Another straightforward Apple Notes Searcher, which is superior to the previous Alfred's [Search Notes](https://github.com/sballin/alfred-search-notes-app), lies in its ability to input multiple parameters, separated by spaces. This version directly invokes Notes to run the built-in multi-keyword search box for searching, which allows for more flexibility and precision in finding one's own notes.

#### Usage:
```
# K_24601 `sn` is the default keyword for this workflow(short for `Search Notes`), Connect multiple search-keywords to be searched with `space` separator. e.g...
sn ceph config set osd
```
