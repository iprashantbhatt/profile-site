#!/bin/bash

cd /var/www/profile

git add .
git commit -m "auto update $(date '+%Y-%m-%d %H:%M:%S')" || exit 0
git push origin main
