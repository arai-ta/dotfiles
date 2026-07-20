tap "hashicorp/tap", trusted: true
tap "heroku/brew"
tap "osx-cross/arm"
tap "osx-cross/avr"
tap "qmk/qmk"

# Official Amazon AWS command-line interface
brew "awscli"
# Isolated development environments using Docker
brew "docker-compose"
# Play, record, convert, and stream select audio and video codecs
brew "ffmpeg"
# Banner-like program prints strings as ASCII art
brew "figlet"
# GitHub command-line tool
brew "gh"
# Remote repository management made easy
brew "ghq"
# Distributed revision control system
brew "git"
# Open source programming language to build simple/reliable/efficient software
brew "go"
# CLI for Drive, Gmail, Calendar, Sheets, Docs, Chat, Admin, and more
brew "googleworkspace-cli"
# JSON output from a shell
brew "jo"
# Lightweight and flexible command-line JSON processor
brew "jq"
# License list generator of all your dependencies for iOS applications
brew "licenseplist"
# Mac App Store command-line interface
brew "mas"
# Open source relational database management system
brew "mysql-client@8.0", link: true
# Network Kanji code conversion Filter (NKF)
brew "nkf"
# Manage multiple Node.js versions
brew "nvm"
# Development kit for the Java programming language
brew "openjdk@21", link: true
# Simplistic interactive filtering tool
brew "peco"
# General-purpose scripting language
brew "php"
# General-purpose scripting language
brew "php@8.1"
# Tool to interact with the Phrase API
brew "phrase-cli"
# Show ps output as a tree
brew "pstree"
# Ruby version manager
brew "rbenv"
# Build tool for Scala projects
brew "sbt"
# Command-line interface for https://speedtest.net bandwidth tests
brew "speedtest-cli"
# General purpose fuzzy finder TUI
brew "television"
# User interface to the TELNET protocol
brew "telnet"
# Terraform version manager inspired by rbenv
brew "tfenv"
# Display directories as trees (with optional color/HTML output)
brew "tree"
# Executes a program periodically, showing output fullscreen
brew "watch"
# Generate your Xcode project from a spec file and your folder structure
brew "xcodegen"
# Vault
brew "hashicorp/tap/vault"
# Terraform
brew "hashicorp/tap/terraform", link: false

# Tool to customise input devices and automate computer systems
cask "bettertouchtool"
# Group chat software
cask "chatwork"
# Anthropic's official Claude AI desktop app
cask "claude"
# Terminal emulator that uses platform-native UI and GPU acceleration
cask "ghostty"
# Web browser
cask "google-chrome"
# Java IDE by JetBrains
cask "intellij-idea"
# Visual tool to design, develop and administer MySQL servers
cask "mysqlworkbench"
# Reverse proxy, secure introspectable tunnels to localhost
cask "ngrok"
# Team communication and collaboration software
cask "slack"
# Open-source code editor
cask "visual-studio-code"

case ENV['LOGNAME']
when 'nt'
  cask "kicad"
  cask "raspberry-pi-imager"
when 'cw-arai'
  # Command-line interface for 1Password
  cask "1password-cli"
  # Script to export current AWS SSO credentials or run a sub-process with them
  brew "aws2-wrap"
  # Kubernetes and container management on the desktop
  cask "rancher"
  # Plugin for AWS CLI to start and end sessions that connect to managed instances
  cask "session-manager-plugin"
  # Set of tools to manage resources and applications hosted on Google Cloud
  cask "gcloud-cli"
  # Web debugging Proxy application
  cask "charles@4"
else
  puts 'LOGNAME base fomulae skipped.'
end

mas "CompareMerge2", id: 1459748650
mas "CotEditor", id: 1024640650
mas "NetworkKit", id: 979299240
mas "Numbers", id: 361304891
mas "Okta Verify", id: 490179405
mas "Seashore", id: 1448648921
mas "Tampermonkey", id: 6738342400
mas "Xcode", id: 497799835

go "github.com/arai-ta/chatwork-cli/cw"
