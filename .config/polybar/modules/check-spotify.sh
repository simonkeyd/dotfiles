#!/bin/bash
ps -aux | grep /usr/bin/spotify | grep -v grep &>/dev/null && return 0 || return 1
