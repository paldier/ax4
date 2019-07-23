#!/bin/sh

#For Netgear wizard function, remove the wizard configuration. 
#file="/opt/vendor/www2/lighttpd4.conf"
dnsmasqFile="/overlay/etc/dnsmasq.conf"
multiLangVerFile="/overlay/opt/vendor/www2/langver.dat"
multiLangVerDataFile="/overlay/opt/vendor/www2/langtable.dat"
dlnaFile="/overlay/etc/config/minidlna"
upnpFile="/overlay//etc/config/upnpd"
systemFile="/overlay/etc/config/system"
lighttpdFile="/overlay/opt/vendor/www2/lighttpd4.conf"
PSDFile="/overlay/opt/lantiq/wave/images/PSD.bin"
RADebugFile="/overlay/etc/rahardcode.dat"
#wifiRadioscript="/overlay/opt/lantiq/wave/scripts/fapi_wlan_wave_radio_set"
wifiScriptsDir="/overlay/opt/lantiq/wave/scripts/"

#if [ -f "$file" ]
#then
#    sed -i 's/^.*url.redirect = ( "^(\/(?!(ramain.htm/url.redirect = ( "^(\/(?!(ramain.htm/g' "$file"; sync; sleep 1;
#fi
if [ -f "$dnsmasqFile" ]
then
    rm -f "$dnsmasqFile"; 
fi

if [ -f "$multiLangVerFile" ]
then
    rm -f "$multiLangVerFile";
    rm -f "$multiLangVerDataFile"; 
fi

if [ -f "$dlnaFile" ]
then
    rm -f "$dlnaFile";
fi

if [ -f "$upnpFile" ]
then
    rm -f "$upnpFile";
fi

if [ -f "$systemFile" ]
then
    rm -f "$systemFile"; 
fi

if [ -f "$lighttpdFile" ]
then
    rm -f "$lighttpdFile";
fi

if [ -f "$PSDFile" ]
then
    rm -f "$PSDFile";
fi

if [ -f "$RADebugFile" ]
then
    rm -f "$RADebugFile";
fi

#if [ -f "$wifiRadioscript" ]
#then
#    rm -f "$wifiRadioscript";
#fi
if [ -d "$wifiScriptsDir" ]
then
    rm -rf "$wifiScriptsDir";
fi


rm -f /overlay/etc/fwLastChecked.txt

/opt/lantiq/usr/sbin/readycloud_nvram restore

sync; sleep 1;

source /usr/sbin/factorycfg.sh
