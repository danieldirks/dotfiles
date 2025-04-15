#!/bin/sh

# adds inactive default workspaces to i3 workspace area
i3-msg -t subscribe -m '["workspace"]' | {
    i3-msg -t get_workspaces;
    while read EVENT; do i3-msg -t get_workspaces; done;
} | jq --unbuffered -c '
    def fake_ws(num; name): {
        num: num,
        name: name,
        visible: false,
        focused: false,
        urgent: false
    };
    . + [ fake_ws(1; "1:"), fake_ws(2; "2:"), fake_ws(3; "3:"), fake_ws(4; "4:󰍩"), fake_ws(5; "5:") ] | unique_by(.name) '
