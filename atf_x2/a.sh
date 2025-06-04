#!/bin/bash

echo "Reading initial redirected input:"
read line
echo "Got from redirected input: $line"

echo "Now switching to interactive terminal input..."
# Reopen stdin from the terminal
exec </dev/tty

# From now on, read interactively
echo -n "Enter something interactively: "
read interactive_input
echo "You typed: $interactive_input"

# Optionally spawn an interactive shell
echo "Spawning interactive shell now (type 'exit' to return)..."
bash -i

echo "Back in script after shell."