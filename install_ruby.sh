#!/bin/bash
# This skript will install Ruby. Must be started with root priveleges (e.g. via sudo)
apt-get update
apt-get install -y ruby-full ruby-bundler build-essential
