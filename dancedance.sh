#!/usr/bin/env bash
#
# ASCII dancing figure demo – cycles through frames in bash.
# Run: ./dancing-dude.sh  (Ctrl+C to stop)
#

set -e

# Frames: stick figure in different dance poses
_frame1() {
  cat << 'EOF'
    \o/
     |
    / \
EOF
}

_frame2() {
  cat << 'EOF'
   _o_
   /|\
   / \
EOF
}

_frame3() {
  cat << 'EOF'
    \o/
    /|
     |
EOF
}

_frame4() {
  cat << 'EOF'
   _o_
  _/|\_
   / \
EOF
}

_frame5() {
  cat << 'EOF'
   \o/
   /|
   / \
EOF
}

_frame6() {
  cat << 'EOF'
    o_
   /|\
   / |
EOF
}

_show() {
  printf "\033[2J\033[H"  # clear and home cursor
  echo ""
  "$1"
  echo ""
}

trap 'printf "\033[?25h"; exit 0' INT TERM
printf "\033[?25l"  # hide cursor

frames=(_frame1 _frame2 _frame3 _frame4 _frame5 _frame6)
i=0

while true; do
  _show "${frames[i]}"
  i=$(( (i + 1) % ${#frames[@]} ))
  sleep 0.25
done
