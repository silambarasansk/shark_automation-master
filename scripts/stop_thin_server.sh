#!/usr/bin/env bash

ps aux | grep thin | grep -v grep | awk '{print $2}' | xargs kill -9 &
exit 0