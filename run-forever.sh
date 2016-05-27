#!/bin/bash

# This ensures we sleep a minute even if the Perl script dies.
#set -o errexit
set -o nounset
set -o pipefail

cd aws-scripts-mon
while true; do
  ./mon-put-instance-data.pl \
    --mem-util --disk-path="$DISK_PATH" --disk-space-util \
    --auto-scaling --aws-credential-file=/keys/cloudwatch-monitor-keys
  sleep 60
done
