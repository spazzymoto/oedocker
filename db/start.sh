#!/bin/bash

function shutdown() {
	rm /tmp/waitdbpipe
	$DLC/bin/proshut /db/sports2000 -by
}
trap 'exit' INT
trap 'shutdown' EXIT

$DLC/bin/proserve /db/sports2000 

# Hack to keep the process in the foreground
mkfifo /tmp/waitdbpipe
while true; do read; done < /tmp/waitdbpipe
