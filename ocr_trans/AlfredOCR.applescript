[[ $file_action -eq 1 ]] || screencapture -i /tmp/snap.png
[[ -f ./AlfredOCR ]] || swiftc ./AlfredOCR.swift
./AlfredOCR