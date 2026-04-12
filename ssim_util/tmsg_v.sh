#!/bin/bash
# Toggle -v flag in cmd: fields of tmsg.ssim for a given test key.
# Usage: tmsg_v.sh on|off [key]
# Default key: atf_x2aws
# Must be run from ~/arnd

set -e

ACTION=${1:-}
KEY=${2:-atf_x2aws}
FILE=data/atfdb/tmsg.ssim

case "$ACTION" in
    on|off) ;;
    *) echo "Usage: $(basename "$0") on|off [key=atf_x2aws]"; exit 1 ;;
esac

[[ -f "$FILE" ]] || { echo "Not found: $FILE (run from arnd/)"; exit 1; }

if [[ "$ACTION" == on ]]; then
    # Remove any existing -v first (idempotent), then insert after binary
    sed -i "
        /tmsg:${KEY}\./!b
        /cmd:/!b
        s|\(cmd:\"[^ ]*\) -v |\1 |
        s|\(cmd:\"[^ ]*\) |\1 -v |
    " "$FILE"
else
    sed -i "
        /tmsg:${KEY}\./!b
        /cmd:/!b
        s|\(cmd:\"[^ ]*\) -v |\1 |
    " "$FILE"
fi

echo "-v ${ACTION} for key=${KEY} in ${FILE}"
