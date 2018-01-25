#!/bin/sh

mkdir -p /dev/disk/by-id
/opt/acestream/start-engine --client-console --allow_remote_access --cache-dir /tmp/.ACEStream --state-dir /opt/state/.ACEStream --log-file /tmp/acestream.log --access-token 69696969 --core-sandbox-max-peers 5 --live-buffer 10 --service-remote-access --stats-report-peers --port 9944