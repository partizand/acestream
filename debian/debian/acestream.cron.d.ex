#
# Regular cron jobs for the acestream package
#
0 4	* * *	root	[ -x /usr/bin/acestream_maintenance ] && /usr/bin/acestream_maintenance
