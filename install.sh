#!/bin/bash

# 1. Get the current username
CURRENT_USER=$(whoami)

echo "Setting up Anyrun configuration for user: $CURRENT_USER"

# 2. copy the template and replace {{USER}} with the actual username
sed "s/{{USER}}/$CURRENT_USER/g" ~/dotfiles/anyrun/.config/anyrun/style.css.template > ~/dotfiles/anyrun/.config/anyrun/style.css

stow anyrun

echo "Setup complete! Files linked."