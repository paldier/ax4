#!/bin/sh 

if [ ! "$CONFIGLOADED" ]; then
        if [ -r /etc/rc.d/config.sh ]; then
                . /etc/rc.d/config.sh 2>/dev/null
                CONFIGLOADED="1"
        fi
fi

scapi_utils_init()
{
	local file="/opt/lantiq/etc/.certchk"
	local fwfile="/opt/lantiq/etc/csd/fwboot"

	#create certificate for lighthttpd on first boot.
	if [ ! -s $file ] ; then
		key=`scapiutil get_key`
	fi

	#check whether fw boot or normal boot
	if [ -f $fwfile ] ; then

		#find last running configuration
		file=`cat /opt/lantiq/etc/csd/csdswap`
	        _lastmodified=`echo $file | cut -d \= -f 2`

		if [[ $_lastmodified -eq 1 ]] ; then
			csdutil merge /opt/lantiq/config/.run-data.xml /rom/etc/datacfg /rom/etc/ctrlcfg
		else
			csdutil merge /opt/lantiq/config/.run-data-swp.xml /rom/etc/datacfg /rom/etc/ctrlcfg
		fi

		#remove fwboot
		[ -e $fwfile ] && rm $fwfile

		# David Yeh, 20190123, NETGEAR (RAX40-513), (beta)[IR-113][IR-213] Streaming issue with Chromecast.
		# David Yeh, 20190123, NETGEAR (RAX40-558), (beta) [IR-155, 238] Issues accessing other devices on same wifi band.
		#add update_db file
		touch /tmp/update_db
	fi

	#create log soft link under /tmp directory for procd log on boot.

	# The source directory and target directories.
	target_location="/tmp/debug_level" # Contains the working location of file.
	source_location="/opt/lantiq/etc/debug_level" # file location. 

	if [ ! -s $source_location ] ; then
		echo '2' > $source_location
		echo '#Auto generated file for procd debug level(1-5)' >> $source_location
	fi

	ln -s "$source_location" "$target_location"

	#check devices comming up with default mac or not.
	old_mac=`scapiutil get_mac`
	[ -n "$CONFIG_UBOOT_CONFIG_ETHERNET_ADDRESS" -a -n "$old_mac" ] && \
	  [ "$old_mac" = "$CONFIG_UBOOT_CONFIG_ETHERNET_ADDRESS" ] && {
		#20190108, Ignore reboot for production code if use default mac address.
		echo -en "###### Default Mac Address. Ignore reboot for customize#####\n";	  
		#local i=0;
		#while [ $i -lt 5 ]; do
		#	echo -en "\033[J"; usleep 150000;
		#	echo -en "#######################################################\n";
		#	echo -en "#     DEVICE CONFIGURED WITH DEFAULT MAC ADDRESS!!    #\n";
		#	echo -en "# This may conflict with other devices. Please change #\n";
		#	echo -en "#     the MAC address for un-interrupted services.    #\n";
		#	echo -en "#######################################################\n";
		#	echo -en "\033[5A\033G"; usleep 300000;
		#	let i++
		#done; echo -en "\n\n\n\n\n";
		#echo -en "######Please configure the MAC from uboot using \n";
		#echo -en "######set ethaddr 'xx:xx:xx:xx:xx' \n";
		#echo -en "###### Board is going to reboot#####\n";
		#sleep 5;
		#reboot;
	} || true
}

boot_hook_add preinit_essential scapi_utils_init

