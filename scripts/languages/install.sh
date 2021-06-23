#!/usr/bin/env bash

set -euo pipefail

source "$DOTFILES_PATH/scripts/core/_main.sh"

##? Apply all symlinks
##?
##? Usage:
##?    install
##?
docs::parse "$@"

if ! platform::command_exists java; then
  if platform::command_exists apt; then
    sudo apt -y install default-jdk default-jre 2>&1 | log::append "Installing java"
  elif platform::command_exists dnf; then
    sudo dnf -y install default-jdk default-jre 2>&1 | log::append "Installing java"
  elif platform::command_exists yum; then
    yes | sudo yum install default-jdk default-jre 2>&1 | log::append "Installing java"
  elif platform::command_exists brew; then
    yes | brew install openjdk 2>&1 | log::append "Installing java"
  elif platform::command_exists pacman; then
    sudo pacman -S --noconfirm default-jdk default-jre 2>&1 | log::append "Installing java"
  fi
fi

log::success "Java installed"

if ! platform::command_exists go; then
  if platform::command_exists apt; then
    sudo apt -y install golang 2>&1 | log::append "Installing golang"
  elif platform::command_exists dnf; then
    sudo dnf -y install golang 2>&1 | log::append "Installing golang"
  elif platform::command_exists yum; then
    yes | sudo yum install golang 2>&1 | log::append "Installing golang"
  elif platform::command_exists brew; then
    yes | brew install go 2>&1 | log::append "Installing golang"
  elif platform::command_exists pacman; then
    sudo pacman -S --noconfirm golang 2>&1 | log::append "Installing golang"
  fi
fi

log::success "Golang installed"