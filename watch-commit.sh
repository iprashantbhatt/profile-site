#!/bin/bash
echo "Watching /var/www/profile for changes..."
while inotifywait -r -e modify,create,delete,move \
  --exclude '(\.git|\.log|\.bak|\.mp3|\.jpg|\.png)' \
  /var/www/profile; do
  echo "Change detected at $(date)"
  sleep 2
  cd /var/www/profile
  git add .
  CHANGES=$(git status --porcelain)
  if [ -n "$CHANGES" ]; then
    git commit -m "Auto: $(date '+%Y-%m-%d %H:%M:%S')"
    git push origin main
    echo "Pushed to GitHub"
  fi
done
