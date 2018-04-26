#!/usr/bin/env bash
# grab the gems for the project

set -o errexit

main() {
  set -o nounset
  set -o xtrace

  if [[ "$PATH" != *"${PWD}/bin"* ]]; then
    export PATH="${PWD}/bin:$PATH"
  fi
  gem install --no-ri --no-rdoc bundler:'~>1.13' || return
  bundle install --path .bundle --clean --binstubs || return
}
post_install_notes() {
  local bold=$(tput bold)
  local normal=$(tput sgr0)
  printf -- "- Run tests with ${bold}bundle exec rake${normal} command\n\n" || return
}

main "$@"
post_install_notes
unset -f main post_install_notes
