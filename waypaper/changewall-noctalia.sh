# #!/bin/bash

# # Przeładuj plik .ini w Foot
# /usr/bin/pkill -SIGUSR1 -u "$USER" -x foot

# # Wyślij sekwencje kolorów bezpośrednio do TTY (dokładnie tak jak robił to pywal!)
# if [ -f "$HOME/.cache/noctalia/sequences" ]; then
#     for tty in /dev/pts/[0-9]*; do
#         [ -w "$tty" ] && cat "$HOME/.cache/noctalia/sequences" > "$tty" 2>/dev/null
#     done
# elif [ -f "$HOME/.cache/wal/sequences" ]; then
#     for tty in /dev/pts/[0-9]*; do
#         [ -w "$tty" ] && cat "$HOME/.cache/wal/sequences" > "$tty" 2>/dev/null
#     done
# fi