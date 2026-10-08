#!/bin/sh
# Vulnserver answers on 9999 with its banner and lists its commands on HELP.
set -eu
out=$( (sleep 2; printf 'HELP\r\n'; sleep 2; printf 'EXIT\r\n') | nc -w 8 win01 9999 || true)
echo "$out" | grep -q "Welcome to Vulnerable Server"
echo "$out" | grep -q "TRUN"
echo "Vulnserver answers with its banner and commands"
