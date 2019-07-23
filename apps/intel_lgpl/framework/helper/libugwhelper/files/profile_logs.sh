#!/bin/sh


PROFILE_FILE_PATH="/opt/lantiq/etc/profile.log" 


([ -z "$1" ]||[ -z "$2" ]) && {
	echo "Usage: $0 <module> <profile enable/diable> <file>"
	echo "Option: $0 <servd/cgi/devmd/all> <0-1> <1-3>"
	exit 1;
}


if [ "$1" = "servd" ]; then
    slloglevel profile $2 $3 
elif [ "$1" = "devmd" ]; then
    DevmLogLevel profile $2 $3
elif [ "$1" = "cgi" ]; then
   #if profile  enabled  
    if [ $2 == 1  ]; then
        touch $PROFILE_FILE_PATH ;
        if [ $3 == 2 ]; then

        found_added_object=`sed -n '/^#object_added:/,$p' $PROFILE_FILE_PATH`
        echo "object:Device.DeviceInfo.VendorLogFile.: :ADD" > $PROFILE_FILE_PATH
        echo "param:X_LANTIQ_COM_Source: :user" >> $PROFILE_FILE_PATH         
        echo "param:X_LANTIQ_COM_LogLevel: :info" >> $PROFILE_FILE_PATH       
        echo "param:X_LANTIQ_COM_Destination: :console" >> $PROFILE_FILE_PATH 
        echo "param:X_LANTIQ_COM_LogFilePath: :/var/log" >> $PROFILE_FILE_PATH
        echo "param:X_LANTIQ_COM_FilterString: :webcgi" >> $PROFILE_FILE_PATH
        #caltest -s $PROFILE_FILE_PATH -c WEB ;
        object_added=`caltest -s $PROFILE_FILE_PATH -c WEB  | grep -o "Device.DeviceInfo.VendorLogFile.[[:digit:]]\+\."` ;
        echo "#object_added:$object_added" >> $PROFILE_FILE_PATH ;

        for i in "$found_added_object"
        do
        echo "$i" >> $PROFILE_FILE_PATH
        done 

        elif [ $3 == 1 ]; then

        found_delete_object=`awk '/^#object_added:/,$2' $PROFILE_FILE_PATH | sed 's/^#object_added://'`

        echo "" > $PROFILE_FILE_PATH
        
        for i in "$found_delete_object"
        do

        echo "object:$i: :DELETE" >> $PROFILE_FILE_PATH
        done
        caltest -s $PROFILE_FILE_PATH -c WEB ;
        fi
    elif [ $2 == 0  ]; then 
        found_delete_object=`awk '/^#object_added:/,$2' $PROFILE_FILE_PATH | sed 's/^#object_added://'`

        echo "" > $PROFILE_FILE_PATH
        
        for i in "$found_delete_object"
        do

        echo "object:$i: :DELETE" >> $PROFILE_FILE_PATH
                                                                              
        done
        caltest -s $PROFILE_FILE_PATH -c WEB ;

        rm -rf $PROFILE_FILE_PATH
    fi
elif [ "$1" = "all" ]; then
    slloglevel profile $2 $3 
    DevmLogLevel profile $2 $3

    if [ $2 == 1  ]; then
        touch $PROFILE_FILE_PATH ;
        if [ $3 == 2 ]; then

        found_added_object=`sed -n '/^#object_added:/,$p' $PROFILE_FILE_PATH`
        echo "object:Device.DeviceInfo.VendorLogFile.: :ADD" > $PROFILE_FILE_PATH
        echo "param:X_LANTIQ_COM_Source: :user" >> $PROFILE_FILE_PATH         
        echo "param:X_LANTIQ_COM_LogLevel: :info" >> $PROFILE_FILE_PATH       
        echo "param:X_LANTIQ_COM_Destination: :console" >> $PROFILE_FILE_PATH 
        echo "param:X_LANTIQ_COM_LogFilePath: :/var/log" >> $PROFILE_FILE_PATH
        echo "param:X_LANTIQ_COM_FilterString: :webcgi" >> $PROFILE_FILE_PATH
        #caltest -s $PROFILE_FILE_PATH -c WEB ;
        object_added=`caltest -s $PROFILE_FILE_PATH -c WEB  | grep -o "Device.DeviceInfo.VendorLogFile.[[:digit:]]\+\."` ;
        echo "#object_added:$object_added" >> $PROFILE_FILE_PATH ;

        for i in "$found_added_object"
        do
        echo "$i" >> $PROFILE_FILE_PATH
        done 

        elif [ $3 == 1 ]; then

        found_delete_object=`awk '/^#object_added:/,$2' $PROFILE_FILE_PATH | sed 's/^#object_added://'`

        echo "" > $PROFILE_FILE_PATH
        
        for i in "$found_delete_object"
        do

        echo "object:$i: :DELETE" >> $PROFILE_FILE_PATH
        done
        caltest -s $PROFILE_FILE_PATH -c WEB ;
        fi
    elif [ $2 == 0  ]; then 
        found_delete_object=`awk '/^#object_added:/,$2' $PROFILE_FILE_PATH | sed 's/^#object_added://'`

        echo "" > $PROFILE_FILE_PATH
        
        for i in "$found_delete_object"
        do

        echo "object:$i: :DELETE" >> $PROFILE_FILE_PATH
                                                                              
        done
        caltest -s $PROFILE_FILE_PATH -c WEB ;

        rm -rf $PROFILE_FILE_PATH
    fi


else
    echo "Invalid arguments provided"
	echo "Usage: $0 <servd/cgi/devmd/all> <0-1> <1-3>"
	exit 1;
fi

