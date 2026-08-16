#!/bin/sh
# Fake aws CLI: silently accept all commands and exit 0
# Reads and discards stdin to handle 'aws configure' heredoc input
cat > /dev/null 2>&1 || true
exit 0
