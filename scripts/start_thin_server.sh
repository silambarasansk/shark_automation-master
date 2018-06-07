#!/usr/bin/env bash

./scripts/stop_thin_server.sh
bundle exec thin start -d -l ./logs/shark.log
