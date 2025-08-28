#!/usr/bin/env bash

# def func
qmp() {
    local sock="/tmp/qmp.sock"
    if [ $# -eq 0 ]; then
        echo "Usage: qmp '<json command>'"
        return 1
    fi
    {
        echo '{ "execute": "qmp_capabilities" }'
        for arg in "$@"; do
            echo "$arg"
        done
    } | sudo socat - UNIX-CONNECT:"$sock"
}

# dump full memory
qmp '{ "execute": "dump-guest-memory", "arguments": { "protocol": "file:./guest.vmcore", "paging": true } }'