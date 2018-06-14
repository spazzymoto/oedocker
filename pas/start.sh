#!/bin/bash

function shutdown() {
	rm /tmp/waitpaspipe
	/app/bin/tcman.sh stop
}
trap 'exit' INT
trap 'shutdown' EXIT

# Hack to give the db a chance to start, might not need this.
sleep 10

/app/bin/tcman.sh start

# Hack to keep the process in the foreground
mkfifo /tmp/waitpaspipe
while true; do read; done < /tmp/waitpaspipe
