#!/bin/bash
# Generate .sh file from the file specified.
#

_help ()
{
	echo -en "[$0] Help:\n\tGenerates '.sh' file from '.h' file which converts\n\t'#define' macros or 'enum' macros to exported shell macros.\n"
	echo -en "\n\tUsage: $0 <input filename.h> <out filesname.sh>\n\n"
}

convert_h_to_sh ()
{
	local count=0;
	local line lnA ln1 ln2;

	echo -en "#\n# Automatically generated include script for UGW Service Library Notifications. Donot Edit.\n"
	echo -en "# Source this script to get notification macro values for the notification mechanism such as ubus.\n#\n"
	echo -en "if [ -z \"\$FLG_UGW_NOTIFY_EXPORTED\" ]; then\n"
	gcc -P -E "$1" | \
	(
		while read line; do
			unset lnA ln1 ln2
			lnA=`echo $line|grep -w -E '^NOTIFY_.*|^__NOTIFY_.*|^#define NOTIFY_.*|^#define __NOTIFY_.*'|sed -e 's/#define //' -e 's/=/ /' -e 's/,/ /'`;
			[ -n "$lnA" ] && {
				ln1=`echo $lnA|awk '{ print $1 }'`;
				ln2=`echo $lnA|awk '{ print $2 }'`;
				[ -z "$ln2" ] && {
					ln2=$count
				} || count=$ln2;
				count=$((count+1));
				echo -en "\texport $ln1=$ln2\n"
			}
		done
	)
	echo -en "\n\texport FLG_UGW_NOTIFY_EXPORTED=y\nfi\n";
}

input_chk ()
{
	local suffix1_chk=`[ -n "$1" ] && echo "$1"|rev|cut -d. -f1||echo 0`;
	local suffix2_chk=`[ -n "$2" ] && echo "$2"|rev|cut -d. -f1||echo 0`;
	([ -n "$1" ] && [ -f "$1" ] && [ -n "$2" ] && [ "$suffix1_chk" = "h" -a "$suffix2_chk" = "hs" ]) || {
		_help;
		exit 1;
	}
}

input_chk "$1" "$2";
convert_h_to_sh "$1" > "$2"
[ -f "$2" ] && {
	chmod +x "$2" 2>/dev/null || true
}

