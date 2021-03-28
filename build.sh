if ! gem spec jazzy > /dev/null 2>&1; then
  sudo gem install jazzy
fi

jazzy
