#!/bin/sh
#
# version.sh prints versions of subsystem modules defined in this script.
# To add a new subsystem, simply define ver_<subsystem>() function and echo the version content.
#

ver_system()
{
	local _bootloader _system_type _machine _model_name _cpus _clock;
	_bootloader="`sed -e 's/.*ubootver=\(.*\)/BOOTLoader: \1/' -e '/BOOTLoader:/p' -n /proc/cmdline`"
	[ -n "$_bootloader" ] && {
		echo $_bootloader;
	}
	_machine="`sed -e '/machine.*:/!d' -e 's/machine.*: //' /proc/cpuinfo`"
	if [ -n "$_machine" ] && [ "$_machine" != "Unknown" ]; then
		_cpus="$_machine";
	else
		_model_name="`sed -e '/model.*name.*:/!d' -e 's/model.*name.*: //' /proc/cpuinfo|sort -u 2>/dev/null`"
		[ -n "$_model_name" ] && {
			_cpus="$_model_name";
		} || {
			_system_type="`sed -e '/system.*type.*:/!d' -e 's/system.*type.*: //' /proc/cpuinfo`"
			[ -n "$_system_type" ] && _cpus="$_system_type";
		}
	fi
	echo "CPU: $_cpus"
	_no_of_cpus=`grep processor.*: /proc/cpuinfo|wc -l`
	[ -n "$_no_of_cpus" ] && {
		echo "No. of CPUs: $_no_of_cpus"
	}
	_clock="`sed -e '/cpu.*MHz.*:/!d' -e 's/cpu.*MHz.*: //' /proc/cpuinfo|sort -u 2>/dev/null`"
	[ -n "$_clock" ] && {
		echo "Clock per CPU: $_clock MHz"
	}
        echo "Kernel: `uname -s` `uname -r`"
	echo "Kernel Timestamp: `uname -v`"
	[ -f /etc/version -o -f /etc/timestamp ] && {
		echo "Software: `cat /etc/version`-`cat /etc/timestamp`";
	} || {
		[ -f /etc/openwrt_version -a -f /etc/openwrt_release ] && {
			. /etc/openwrt_release 2>/dev/null
			echo "Software: $DISTRIB_ID '$DISTRIB_RELEASE' $DISTRIB_REVISION"
		}
	}
}

ver_toolchain()
{
	local _toolchain_ver;
	if [ -f /etc/toolchain_ver ]; then
		echo "Toolchain: `cat /etc/toolchain_ver`";
	else
		_toolchain_ver=`/usr/sbin/upgrade 2>/dev/null|sed -e '/ToolChain/!d' -e 's/ToolChain://'`
		if [ -n "$_toolchain_ver" ]; then
			echo "Toolchain: $_toolchain_ver";
		else
			[ -f "/tmp/toolchain-ver" ] && {
				echo "Toolchain: `cat /tmp/toolchain-ver`";
			} || {
				_toolchain_ver="$(cat /proc/version)";
				_toolchain_ver="${_toolchain_ver/*gcc version/}";
				echo "Toolchain: ${_toolchain_ver/) \#*/}";
			}
		fi
	fi
}

ver_dsl()
{
	local ii _line _param _val;
	local _fw_vdsl_ver _fw_adsl_ver _mei_ver _drv_ver _app_ver _fapi_ver _sl_ver;
	local _bin_dir="/opt/lantiq/bin";
	local _dsl_fw_dir;
	local verget;
	[ -f ${bin_dir}/what.sh ] && {
		verget="${_bin_dir}/what.sh"
	} || {
		verget=whats
	}
		
	grep -q drv_dsl_cpe_api /proc/modules && {
	
		_drv_ver=`$verget ${_bin_dir}/drv_dsl_cpe_api.ko | cut -c14-`
		_app_ver=`$verget ${_bin_dir}/dsl_cpe_control | cut -d@ -f2 | sed 's/(#)//'`
		_fapi_ver=`$verget /usr/lib/libdslfapi* 2>/dev/null`
		[ -n "$_fapi_ver" ] && _fapi_ver=", FAPI $_fapi_ver"
		_sl_ver=`$verget /usr/lib/libdslsl* 2>/dev/null`
		[ -n "$_sl_ver" ] && _sl_ver=", SL $_sl_ver"
		
		if [ -n "$CONFIG_PACKAGE_DSL_CPE_API_VRX" -o -n "$CONFIG_PACKAGE_IFX_DSL_CPE_API_VRX_BONDING" ]; then
			_mei_ver=`$verget ${_bin_dir}/drv_mei_cpe.ko|sed 's/.*version //'`
			# Firmware directory might be /lib/firmware or /firmware, so we are checking both possibilities
			if [ -f /firmware/xcpe_hw.bin ]; then
				_dsl_fw_dir="/firmware"
			elif [ -f /lib/firmware/xcpe_hw.bin ]; then
				_dsl_fw_dir="/lib/firmware"
			fi
			
			if [ -n "${_dsl_fw_dir}" ]; then
				_fw_vdsl_ver=`$verget ${_dsl_fw_dir}/xcpe_hw.bin | cut -f2 -d@ | cut -c 1-11 | sed 's/(#)//'`
				_fw_adsl_ver=`$verget ${_dsl_fw_dir}/xcpe_hw.bin | cut -f3 -d@ | cut -c13- |sed 's/(#)//'`
			fi

			echo "DSL: FW $_fw_vdsl_ver, $_fw_adsl_ver, MEI $_mei_ver, DRIVER $_drv_ver, APP $_app_ver${_fapi_ver}${_sl_ver}"
			
		else
			if [ -n "$CONFIG_FEATURE_DSL_BONDING_SUPPORT" ]; then
				_line="0"
			fi
			for ii in `/opt/lantiq/bin/dsl_cpe_pipe.sh vig $_line`; do
				_param=${ii%%=*}
				_val=${ii#*=}
				case $_param in
					"DSL_ChipSetFWVersion") _fw_adsl_ver=$_val;;
					"DSL_DriverVersionMeiBsp") _mei_ver=$_val;;
				esac
			done
			
			echo "DSL: FW $_fw_adsl_ver, MEI $_mei_ver, DRIVER $_drv_ver, APP $_app_ver${_fapi_ver}${_sl_ver}"
			
		fi
	}
}

ver_xtc()
{
	# Finding PTM/ATM TC driver version info
	local _xtc_ver;
	_xtc_ver=`cat /proc/driver/vrx518/ver 2>/dev/null|grep -E 'ver'|sed -e 's/:/: /' -e 's/^[ \t]*//'`
	[ -n "$_xtc_ver" ] && echo "$_xtc_ver"
}

ver_ppa()
{
	# Finding PPE/PPA version info
	local _ppa_ver
	_ppa_ver=`ppacmd getversion 2>/dev/null|grep -E 'info|version'|sed -e 's/:/: /' -e 's/^[ \t]*//'`
	[ -n "$_ppa_ver" ] && echo "$_ppa_ver"
}

ver_bios()
{                                                                                                  
        local _bios_ver   
        _bios_ver=`dmesg | grep DMI | awk '{print $(NF-1)}' 2>/dev/null`
        [ -n "$_bios_ver" ] && echo "Bios Version : $_bios_ver" 
}   

ver_switch()
{
	# Switch API information
	local _switch_ver;
	which switch_cli >/dev/null 2>&1 && {
		_switch_ver="`switch_cli GSW_VERSION_GET|sed -e '/Version String:.*\..*/!d' -e 's/.*Version.*: //' 2>/dev/null`"
		if [ -z "$_switch_ver" ]; then
			_switch_ver="`switch_cli IFX_ETHSW_VERSION_GET|sed -e '/Version String:.*\..*/!d' -e 's/.*Version.*: //' 2>/dev/null`"
		fi
		echo "Switch API Version: $_switch_ver"
	}
}

ver_wlan()
{
	if [ "$CONFIG_FEATURE_WIRELESS_WAVE300" = "1" ] || [ "$CONFIG_PACKAGE_FAPI_WLAN_VENDOR_WAVE" = "1" ]; then
		if [ -e /etc/wave_components.ver ]; then
			. /etc/wave_components.ver
			echo "Wave wlan version: $wave_release_minor"
			echo "Wave wlan driver version: $wave_driver_ver"
			echo "Wave wlan MAC FW version: $wave_mac_ver"
			[ -n "$wave_tx_sender_ver" ] && echo "Wave wlan tx_sender version: $wave_tx_sender_ver"
			[ -n "$wave_rx_handler_ver" ] && echo "Wave wlan rx_handler version: $wave_rx_handler_ver"
			[ -n "$wave_host_interface_ver" ] && echo "Wave wlan host_interface version: $wave_host_interface_ver"
			[ -n "$wave_tx_sender_gen5b_ver" ] && echo "Wave wlan tx_sender_gen5b version: $wave_tx_sender_gen5b_ver"
			[ -n "$wave_rx_handler_gen5b_ver" ] && echo "Wave wlan rx_handler_gen5b version: $wave_rx_handler_gen5b_ver"
			[ -n "$wave_host_interface_gen5b_ver" ] && echo "Wave wlan host_interface_gen5b version: $wave_host_interface_gen5b_ver"
			[ -n "$wave_ar10_progmodel_ver" ] && echo "Wave wlan AR10 PROGMODEL version: $wave_ar10_progmodel_ver"
			[ -n "$wave500_progmodel_ver" ] && echo "Wave wlan Wave500 PROGMODEL version: $wave500_progmodel_ver"
			[ -n "$wave500B_progmodel_ver" ] && echo "Wave wlan Wave500B PROGMODEL version: $wave500B_progmodel_ver"
			[ -n "$wave_fpga_sim_ver" ] && echo "FPGA SIM version: $wave_fpga_sim_ver"
			[ -n "$wave_psd_ver" ] && [ "$wave_psd_ver" != "TODO_UPDATE_VER_STRING" ] && echo "Wave wlan PSD version: $wave_psd_ver"
			[ -n "$wave_scripts_ver" ] && echo "Wave wlan scripts version: $wave_scripts_ver"
		fi
	fi
}

ver_voice()
{
	# only ARX168 and GRX168 don't support voice functionaility
	local tapi_str
	if [ -r /proc/driver/tapi/version ] && [ -r /proc/driver/vmmc/version ] && [ -r /proc/driver/ltq_mps_voice/version ]; then
		tapi_str="TAPI `grep TAPI /proc/driver/tapi/version | cut -d' ' -f3`, VMMC `grep VMMC /proc/driver/vmmc/version | cut -d ' ' -f6`, MPS `grep MPS /proc/driver/ltq_mps_voice/version | cut -d' ' -f6`"
		echo Voice: $tapi_str
	fi
}

ver_voip()
{
	[ -f /usr/sbin/VoIP_VERSION ] && {
		sed 's/.*em/\0: \1/' /usr/sbin/VoIP_VERSION
	}
}

ver_dect()
{
	if [ -f /proc/driver/dect/version ]; then
		sed 's/.*em/\0: \1/' /usr/sbin/DECT_VERSION
		sed -e '/^$/d' -e '/Modules.*/d' -e 's/.*[a-z]/\0: \1/' /proc/driver/dect/version
	fi
}

ver_devm()
{
	if [ -f /usr/sbin/DEVMD_VERSION ];  then
		sed 's/ :/: /' /usr/sbin/DEVMD_VERSION
	fi
}

ver_coc()
{
	local VER_STR DRV_STR
	if [ -e /opt/lantiq/bin/pm_util ]; then
		VER_STR=`/opt/lantiq/bin/pm_util -v`
		echo "pm_util version: $VER_STR"
	fi

	if [ -e /opt/lantiq/bin/ppmd ]; then
		VER_STR=`/opt/lantiq/bin/ppmd -v`
		echo "ppmd version: $VER_STR"
	fi  

	if [ -e /sys/class/hwmon/hwmon0/device/version ]; then
		VER_STR=`cat /sys/class/hwmon/hwmon0/device/version`
		DRV_STR=`cat /sys/class/hwmon/hwmon0/device/name`
		echo "$DRV_STR version: $VER_STR"
	fi  

	if [ -e /sys/class/misc/ltq_pmcu/version ];then
		VER_STR=`cat /sys/class/misc/ltq_pmcu/version`
		DRV_STR=`cat /sys/class/misc/ltq_pmcu/name`
		echo "$DRV_STR version: $VER_STR"
	fi

	if [ -e /sys/class/hwmon/hwmon2/device/version ];then
		VER_STR=`cat /sys/class/hwmon/hwmon2/device/version`
		DRV_STR=`cat /sys/class/hwmon/hwmon2/device/name`
		echo "$DRV_STR version: $VER_STR"
	fi

	if [ -e /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver ];then
		VER_STR=`cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver`
		echo "CoC: $VER_STR"
	fi
}



#---- Donot Edit below this line -------------#

if [ -r /etc/config.sh ]; then
	. /etc/config.sh 2>/dev/null
fi

whats()
{
	local ival
	for ival in $*; do
		strings $ival | grep -m1 "@(#)"|sed 's/\(.*\)@(#)\(.*\)/\2/g'
	done
}

_functions=$(sed -e '/.*sed.*ver.*/d' -e '/.*ver_\$1/d' -e 's/(.*).*//' -e '/^ver_.*/p' -n $0)

if [ -n "$1" ]; then
	case "$1" in
		-h|--help|help) echo "Usage:- $0 [modules|-h (help)|-f (force show)]";
		echo "modules:-"; echo "$_functions"|sed 's/ver_/  /';
		exit 0;;
		-f|--force|force) rm -f /tmp/version;;
		*) if [ `echo "$_functions"|grep -w ver_$1` ]; then ver_$1; else
			echo "Not found. Use below modules:- ";
			echo "$_functions"|sed 's/ver_/  /';
		fi
		exit 0;;
	esac
fi
[ -f /tmp/version ] && {
	cat /tmp/version
} || {
	for _ii in $_functions; do $_ii; done > /tmp/version
	cat /tmp/version
}

