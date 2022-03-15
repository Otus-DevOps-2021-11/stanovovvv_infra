#!/bin/bash
# This skript will deploy the test app.
git clone -b monolith https://github.com/express42/reddit.git
cd reddit
bundle install
puma -d
