tap "heroku/brew"
tap "homebrew/bundle"
tap "homebrew/cask"
tap "homebrew/core"
tap "qmk/qmk"

brew "heroku/brew/heroku"
brew "qmk/qmk/qmk"
brew "awscli"
brew "figlet"
brew "gh"
brew "ghq"
brew "git"
brew "github-release"
brew "go"
brew "httpie"
brew "jo"
brew "jq"
brew "mas"
brew "nkf"
brew "peco"
brew "pstree"
brew "rogue"
brew "telnet"
brew "terraform", link: false
brew "tfenv"
brew "sbt"
brew "speedtest-cli"
brew "watch"

cask "ngrok"
cask "bettertouchtool"
cask "bitbar"
cask "chatwork"
cask "docker"
cask "firefox"
cask "fork"
cask "google-chrome"
cask "intellij-idea"
cask "mysqlworkbench"
cask "slack"
cask "visual-studio-code"

case ENV['LOGNAME']
when 'nt'
  cask "kicad"
  cask "raspberry-pi-imager"
when 'cw-arai'
  cask "charles"
else
  puts 'LOGNAME base fomulae skipped.'
end

mas "app.seashore", id: 1448648921
mas "CompareMergeLite", id: 1459748650
mas "CotEditor", id: 1024640650
mas "Epochulator", id: 531022911
mas "Xcode", id: 497799835
